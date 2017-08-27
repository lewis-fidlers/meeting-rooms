//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require bootstrap-datepicker

$( document ).on('turbolinks:load', function() {
  $(".datepicker").datepicker({
    format: 'dd/mm/yyyy',
  });
});
