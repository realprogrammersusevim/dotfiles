window.onload = setInterval(clock, 1);

function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? "PM" : "AM";
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? "0" + minutes : minutes;
  var strTime = hours + ":" + minutes + " " + ampm;
  return strTime;
}

function clock() {
  var d = new Date();
  var date = d.getDate();
  var year = d.getFullYear();
  var month = d.getMonth();
  var monthArr = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  month = monthArr[month];
  var dateDMY = date + " " + month + ", " + year;
  var currentTime = formatAMPM(d);
  document.getElementById("date").innerHTML = dateDMY + " " + currentTime;
}
