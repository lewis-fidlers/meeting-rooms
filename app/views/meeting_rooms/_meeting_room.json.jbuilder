json.extract! meeting_room, :id, :number_of_persons, :name, :created_at, :updated_at
json.url meeting_room_url(meeting_room, format: :json)
