/* global $ */
$(function() {
  $('#calender_trigger').on('click', function(event) {
    $(".view_calendar").slideToggle();
  });
});