class AddPhoneToAttenders < ActiveRecord::Migration
  def self.up
    add_column :attenders, :phone, :integer
  end

  def self.down
    remove_column :attenders, :phone
  end
end
