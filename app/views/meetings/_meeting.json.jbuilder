json.extract! meeting, :id, :user_id, :meeting_room_id, :start_time, :end_time, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
