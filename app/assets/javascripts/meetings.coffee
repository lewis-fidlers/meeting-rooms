# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MeetingRoomApp.initMeetingRoomSelect2 = () ->
  $("#meeting_meeting_room_id").select2
    theme: 'bootstrap',
    # ajax:
    #   url: '/meeting_rooms/available'
    #   dataType: 'json'
    #   delay: 250
    #   data: (params) ->
    #     {
    #       q: params.term
    #       page: params.page
    #     }
    #   processResults: (data, params) ->
    #     # parse the results into the format expected by Select2
    #     # since we are using custom formatting functions we do not need to
    #     # alter the remote JSON data, except to indicate that infinite
    #     # scrolling can be used
    #     params.page = params.page or 1
    #     {
    #       results: data.items
    #       pagination: more: params.page * 30 < data.total_count
    #     }
