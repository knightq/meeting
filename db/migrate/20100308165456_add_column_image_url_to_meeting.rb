class AddColumnImageUrlToMeeting < ActiveRecord::Migration
  def self.up
    add_column :meetings, :image_url, :string
  end

  def self.down
    remove_column :meetings, :image_url
  end
end
