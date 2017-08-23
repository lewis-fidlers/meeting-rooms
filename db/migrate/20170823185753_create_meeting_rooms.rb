class CreateMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_rooms do |t|
      t.integer :number_of_persons
      t.string :name

      t.timestamps
    end
  end
end
