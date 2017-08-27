class MeetingRoom < ApplicationRecord
  has_many :meetings

  def to_s
    name
  end
end
