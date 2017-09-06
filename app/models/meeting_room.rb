class MeetingRoom < ApplicationRecord
  has_many :meetings

  validates_uniqueness_of :name

  def available?(start_time, end_time)
    Meeting.where("meeting_room_id = ? AND start_time BETWEEN ? AND ?", self.id, start_time, end_time).empty?
  end

  def to_s
    name
  end
end
