class ChangePhoneToString < ActiveRecord::Migration
  def self.up
    change_column :attenders, :phone, :string
  end

  def self.down
    change_column :attenders, :phone, :integer
  end
end
