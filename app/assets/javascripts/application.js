//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require moment
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require select2
//
// -----Custom-----
//= require meeting-room-app
//= require meetings
//

$( document ).on('turbolinks:load', function() {
  $(".datepicker").datetimepicker({
    sideBySide: true,
    format: "DD-MM-YYYY HH:mm",
    icons: {
      time: "fa fa-clock-o",
      date: "fa fa-calendar",
      up: "fa fa-arrow-up",
      down: "fa fa-arrow-down"
    }
  });

  MeetingRoomApp.initMeetingRoomSelect2();
});
