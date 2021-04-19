/* global $ */
$(function() {
  $('#menu_trigger').on('click', function(event) {
    $('#nav__menu').slideToggle();
    event.preventDefault();
  });
});