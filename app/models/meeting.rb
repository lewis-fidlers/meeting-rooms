class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_room

  validates_presence_of :start_time, :end_time, :meeting_room
  validate :end_time_after_start_time!
  validate :meeting_room_available!

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
end
