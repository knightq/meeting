class ModifyFksToUsers < ActiveRecord::Migration
  def self.up
    rename_column :participations, :attender_id, :user_id
#    remove_foreign_key(:participations, :attenders)
    add_foreign_key :participations, :users
  end

  def self.down
    rename_column :participations, :user_id, :attender_id
    remove_foreign_key :participations, :users
#    add_foreign_key(:participations, :attenders)
  end
end
