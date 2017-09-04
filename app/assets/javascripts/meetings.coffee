# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MeetingRoomApp.initMeetingRoomSelect2 = () ->
  $("#meeting_meeting_room_id").select2
    theme: 'bootstrap',


MeetingRoomApp.drawMeetings = (dom_id, meetings) ->
  meetings.map((meeting) ->
    MeetingRoomApp.drawMeeting(dom_id, meeting)
  )

MeetingRoomApp.drawMeeting = (dom_id, meeting) ->
  $("##{dom_id} [data-meeting-hour='#{i}']").css("background-color", "#e8382c") for i in [meeting.start_hour..meeting.end_hour]
