class RemoveMeetingIdFromAttenders < ActiveRecord::Migration
  def self.up
    remove_foreign_key(:attenders, :meetings)
    remove_column :attenders, :meeting_id
  end

  def self.down
    add_column :attenders, :meeting_id, :integer
    add_foreign_key(:attenders, :meetings)
  end
end
