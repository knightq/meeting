class CreateProposalDates < ActiveRecord::Migration
  def self.up
    create_table :proposal_dates do |t|
      t.date :date
      t.meeting_id :integer
      t.timestamps
    end
    add_foreign_key :proposal_dates, :meetings
  end

  def self.down
    remove_foreign_key :proposal_dates, :meetings
    drop_table :proposal_dates
  end
end
