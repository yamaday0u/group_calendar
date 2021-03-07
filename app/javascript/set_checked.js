const checkedStatus = () => {
  // get elements of calendars for month, week & custom 
  // const monthCalendarElement = document.getElementById("month_calendar");
  // const weekCalendarElement = document.getElementById("week_calendar");
  // const customCalendarElement = document.getElementById("custom_calendar");

  // // get elements of checkboxes for month, week & custom 
  const monthCalendar = document.getElementById("calendar_month");
  const weekCalendar = document.getElementById("calendar_week");
  const customCalendar = document.getElementById("calendar_custom");

  console.log("set")

  if (sessionStorage.key(1)==="key") {
    console.log(sessionStorage.key(1));
    monthCalendar.checked = "true";
  }else if (sessionStorage.key(1)==='week') {
    console.log(sessionStorage.key(1));
    weekCalendar.checked = "true";
  }else if (sessionStorage.key(1)==='custom') {
    console.log(sessionStorage.key(1));
    customCalendar.checked = "true";
  }
}
window.addEventListener("load", checkedStatus);