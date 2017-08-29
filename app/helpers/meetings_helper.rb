module MeetingsHelper
  def draw_meeting_grid(meeting)
    rvalue = ""
    rvalue << "<div class='meeting-day' data-start-hour='#{meeting.start_time.hour}' data-start-min='#{meeting.start_time.min}' data-end-hour='#{meeting.end_time.hour}' data-end-min='#{meeting.end_time.min}'>"
    rvalue << "A meeting from #{meeting.start_time} till #{meeting.end_time}"
    rvalue << "</div>"
    rvalue.html_safe
  end
end
