class CreateProposalDateUsers < ActiveRecord::Migration
  def self.up
    create_table :proposal_date_users do |t|
      t.integer :user_id
      t.integer :proposal_date_id
      t.timestamps
    end
    add_foreign_key(:proposal_date_users, :users)
    add_foreign_key(:proposal_date_users, :proposal_dates)
  end

  def self.down
    remove_foreign_key(:proposal_date_users, :users)
    remove_foreign_key(:proposal_date_users, :proposal_dates)
    drop_table :proposal_date_users
  end
end
