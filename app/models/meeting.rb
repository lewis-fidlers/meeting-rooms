class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_room
end
