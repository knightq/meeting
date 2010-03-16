class AddDurationToMeetings < ActiveRecord::Migration
  def self.up
    add_column :meetings, :duration, :integer
  end

  def self.down
    remove_column :meetings, :duration
  end
end
