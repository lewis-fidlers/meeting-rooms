require 'google/api_client'

class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_room

  validates_presence_of :start_time, :end_time, :meeting_room
  validate :end_time_after_start_time!
  validate :meeting_room_available!

  after_create :create_google_event

  scope :for_day, -> (date = Date.today) do
    where("start_time BETWEEN ? AND ?", date.to_date.beginning_of_day, date.to_date.end_of_day)
  end

  def meeting_room_available!
    return unless start_time && end_time
    if !meeting_room.available?(start_time, end_time)
      errors.add(:meeting_room_id, "#{meeting_room.name} isn't availble at this time.")
    end
  end

  def end_time_after_start_time!
    return unless start_time && end_time
    if end_time < start_time
      errors.add(:end_time, "Me must be after start time")
    end
  end

  def create_google_event
    return if user.token.empty?

    @event = {
      "summary" => "A new meeting",
      "description" => "meeting in #{meeting_room.try(:name)}",
      "location" => "Location",
      "start" => { "dateTime" => start_time.rfc3339 },
      "end" => { "dateTime" => end_time.rfc3339 },
      "attendees" => [ { "email" => "#{user.email}" }]
    }

    client = Google::APIClient.new
    client.authorization.access_token = user.token
    service = client.discovered_api("calendar", "v3")

    @set_event = client.execute(:api_method => service.events.insert,
                                :parameters => {"calendarId" => user.email, "sendNotifications" => true},
                                :body => JSON.dump(@event),
                                :headers => {"Content-Type" => "application/json"})

  end
end
