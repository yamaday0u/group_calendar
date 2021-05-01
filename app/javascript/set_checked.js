if (location.pathname.match("/calendars") || location.pathname.match("/calendar_for_groups")) {
  const checkedStatus = () => {

    // // get elements of checkboxes for month, week & custom 
    const monthCalendar = document.getElementById("calendar_month");
    const weekCalendar = document.getElementById("calendar_week");
    const customCalendar = document.getElementById("calendar_custom");
  
    console.log("set")
  
    if (sessionStorage.key(0)==='month') {
      console.log(sessionStorage.key(0));
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
}
