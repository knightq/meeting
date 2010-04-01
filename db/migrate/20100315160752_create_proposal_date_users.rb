class CreateProposalDateUsers < ActiveRecord::Migration
  def self.up
    remove_foreign_key(:participations, :users)
    change_column :participations, :user, :attender
    add_foreign_key(:participations, :attenders)
  end

  def self.down
    change_column :participations, :attender, :user
    remove_foreign_key(:participations, :attenders)
    add_foreign_key(:participations, :users)
  end
end
