class AddOrganizatorToMeeting < ActiveRecord::Migration
  def self.up
  #  add_column :meetings, :organizator, :integer
  #  add_foreign_key(:meetings, :attenders, :column => 'organizator')
  end

  def self.down
  #  remove_foreign_key(:meetings, :attenders, :column => 'organizator')
  #  remove_column :meetings, :organizator
  end
end
