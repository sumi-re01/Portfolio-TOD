/* global $ */
$(function() {
  $('#calendar_trigger').on('click', function(event) {
    $('.calendar_view').slideToggle();
    event.preventDefault();
  });
});