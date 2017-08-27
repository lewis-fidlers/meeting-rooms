class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_room

  validate :end_time_after_start_time!

  scope :available, -> (from = Date.today, to = Date.tomorrow) {
    MeetingRoom.all
  }

  def end_time_after_start_time!
    if end_time < start_time
      errors.add(:end_time, "Me must be after start time")
    end
  end
end
