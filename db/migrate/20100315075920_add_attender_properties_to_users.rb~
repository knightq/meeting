class AddAttenderPropertiesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :phone, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :email
    remove_column :users, :phone
  end
end
