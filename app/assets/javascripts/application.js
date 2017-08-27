//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require moment
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker

$( document ).on('turbolinks:load', function() {
  $(".datepicker").datetimepicker({
    viewMode: "years",
    icons: {
      time: "fa fa-clock-o",
      date: "fa fa-calendar",
      up: "fa fa-arrow-up",
      down: "fa fa-arrow-down"
    }
  });
});
