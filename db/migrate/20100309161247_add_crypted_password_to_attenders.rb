class AddCryptedPasswordToAttenders < ActiveRecord::Migration
  def self.up
    add_column :attenders, :crypted_password, :string    
  end

  def self.down
    remove_column :attenders, :crypted_password
  end
end
