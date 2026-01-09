#include <math.h>
#include <net/if.h>
#include <net/if_mib.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <sys/select.h>
#include <sys/sysctl.h>

static char unit_str[3][6] = {
    {" Bps"},
    {"KBps"},
    {"MBps"},
};

enum unit { UNIT_BPS, UNIT_KBPS, UNIT_MBPS };

#define MAX_INTERFACES 128

struct network {
  struct timeval tv_nm1, tv_n, tv_delta;

  uint64_t if_ibytes[MAX_INTERFACES];
  uint64_t if_obytes[MAX_INTERFACES];
  bool if_init[MAX_INTERFACES];

  int up;
  int down;
  enum unit up_unit, down_unit;
};

static inline void ifdata(uint32_t net_row, struct ifmibdata *data) {
  static size_t size = sizeof(struct ifmibdata);
  static int32_t data_option[] = {CTL_NET,      PF_LINK, NETLINK_GENERIC,
                                  IFMIB_IFDATA, 0,       IFDATA_GENERAL};
  data_option[4] = net_row;
  if (sysctl(data_option, 6, data, &size, NULL, 0) < 0) {
    memset(data, 0, sizeof(struct ifmibdata));
  }
}

static inline void network_init(struct network *net) {
  memset(net, 0, sizeof(struct network));
}

static inline void network_update(struct network *net) {
  gettimeofday(&net->tv_n, NULL);

  if (net->tv_nm1.tv_sec == 0) {
    net->tv_nm1 = net->tv_n;
  }

  timersub(&net->tv_n, &net->tv_nm1, &net->tv_delta);

  double time_scale = (net->tv_delta.tv_sec + 1e-6 * net->tv_delta.tv_usec);
  net->tv_nm1 = net->tv_n;

  static int count_option[] = {CTL_NET, PF_LINK, NETLINK_GENERIC, IFMIB_SYSTEM,
                               IFMIB_IFCOUNT};
  uint32_t interface_count = 0;
  size_t size = sizeof(uint32_t);
  if (sysctl(count_option, 5, &interface_count, &size, NULL, 0) < 0) {
    return;
  }

  uint64_t total_delta_ibytes = 0;
  uint64_t total_delta_obytes = 0;
  struct ifmibdata data;

  for (uint32_t i = 0; i < interface_count && i < MAX_INTERFACES; i++) {
    ifdata(i, &data);

    if (!net->if_init[i]) {
      net->if_init[i] = true;
      net->if_ibytes[i] = data.ifmd_data.ifi_ibytes;
      net->if_obytes[i] = data.ifmd_data.ifi_obytes;
      continue;
    }

    if ((data.ifmd_flags & IFF_UP) && (data.ifmd_flags & IFF_RUNNING) &&
        !(data.ifmd_flags & IFF_LOOPBACK)) {

      if (data.ifmd_data.ifi_ibytes >= net->if_ibytes[i])
        total_delta_ibytes += (data.ifmd_data.ifi_ibytes - net->if_ibytes[i]);

      if (data.ifmd_data.ifi_obytes >= net->if_obytes[i])
        total_delta_obytes += (data.ifmd_data.ifi_obytes - net->if_obytes[i]);
    }

    net->if_ibytes[i] = data.ifmd_data.ifi_ibytes;
    net->if_obytes[i] = data.ifmd_data.ifi_obytes;
  }

  if (time_scale < 1e-6)
    return;

  double delta_ibytes = (double)total_delta_ibytes / time_scale;
  double delta_obytes = (double)total_delta_obytes / time_scale;

  double exponent_ibytes = log10(delta_ibytes);
  double exponent_obytes = log10(delta_obytes);

  if (exponent_ibytes < 3) {
    net->down_unit = UNIT_BPS;
    net->down = delta_ibytes;
  } else if (exponent_ibytes < 6) {
    net->down_unit = UNIT_KBPS;
    net->down = delta_ibytes / 1000.0;
  } else if (exponent_ibytes < 9) {
    net->down_unit = UNIT_MBPS;
    net->down = delta_ibytes / 1000000.0;
  }

  if (exponent_obytes < 3) {
    net->up_unit = UNIT_BPS;
    net->up = delta_obytes;
  } else if (exponent_obytes < 6) {
    net->up_unit = UNIT_KBPS;
    net->up = delta_obytes / 1000.0;
  } else if (exponent_obytes < 9) {
    net->up_unit = UNIT_MBPS;
    net->up = delta_obytes / 1000000.0;
  }
}
