#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "../sketchybar.h"

#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
  float update_freq;
  if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
    printf("Usage: %s \"<event-name>\" \"<event_freq>\"\n", argv[0]);
    exit(1);
  }

  // Setup the event in sketchybar
  char event_message[512];
  snprintf(event_message, 512, "--add event '%s'", argv[1]);
  sketchybar(event_message);

  FILE *fp;
  char buffer[BUFFER_SIZE];
  char cmd[512];
  snprintf(cmd, 512,
           "sudo powermetrics --samplers gpu_power -i %d 2>&1", // Made a sudo
                                                                // exception for
                                                                // powermetrics
           (int)update_freq * 1000);

  // Open powermetrics command
  fp = popen(cmd, "r");
  if (fp == NULL) {
    printf("Failed to run powermetrics command. Make sure to run with sudo.\n");
    return 1;
  }

  char trigger_message[512];
  // Read the output line by line
  while (fgets(buffer, BUFFER_SIZE, fp) != NULL) {
    // Look for GPU utilization line
    if (strstr(buffer, "GPU idle residency: ") != NULL) {
      char *percent = strstr(buffer, ": ") + 2; // Skip ": "
      float free = atof(percent);
      float usage = 100.0 - free;
      int rounded_usage = (int)usage;

      snprintf(trigger_message, 512, "--trigger '%s' gpu_usage='%d'", argv[1],
               rounded_usage);
      sketchybar(trigger_message);

      fflush(stdout);
    }
  }

  // Clean up
  pclose(fp);
  return 0;
}
