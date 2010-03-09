class CreateProposalDates < ActiveRecord::Migration
  def self.up
    create_table :proposal_dates do |t|
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :proposal_dates
  end
end
