const displayCalendar = () => {

  // get elements of calendars for month, week & custom 
  const monthCalendarElement = document.getElementById("month_calendar");
  const weekCalendarElement = document.getElementById("week_calendar");
  const customCalendarElement = document.getElementById("custom_calendar");

  // // get elements of checkboxes for month, week & custom 
  const monthCalendar = document.getElementById("calendar_month");
  const weekCalendar = document.getElementById("calendar_week");
  const customCalendar = document.getElementById("calendar_custom");
  console.log("switch calendar")

  const switchCalendar = () => {
    
    if (monthCalendar.checked) {
      monthCalendarElement.style.display="block";
      weekCalendarElement.style.display="none";
      customCalendarElement.style.display="none";
      sessionStorage.setItem('month', monthCalendar.checked = "true");
      sessionStorage.removeItem('week');
      sessionStorage.removeItem('custom');
    }else if(weekCalendar.checked) {
      monthCalendarElement.style.display="none";
      weekCalendarElement.style.display="block";
      customCalendarElement.style.display="none";
      sessionStorage.setItem('week', weekCalendar.checked = "true");
      sessionStorage.removeItem('month');
      sessionStorage.removeItem('custom');
    }else if (customCalendar.checked) {
      monthCalendarElement.style.display="none";
      weekCalendarElement.style.display="none";
      customCalendarElement.style.display="block";
      sessionStorage.setItem('custom', customCalendar.checked = "true");
      sessionStorage.removeItem('month');
      sessionStorage.removeItem('week');
    }
  }
  window.addEventListener("click", switchCalendar);
  window.addEventListener("load", switchCalendar);
} 
window.addEventListener("load", displayCalendar);