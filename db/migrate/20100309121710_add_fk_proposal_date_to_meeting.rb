class AddFkProposalDateToMeeting < ActiveRecord::Migration
  def self.up
    add_column :proposal_dates, :meeting_id, :integer
    add_foreign_key(:proposal_dates, :meetings)
  end

  def self.down
    remove_foreign_key(:proposal_dates, :meetings)
    remove_column :proposal_dates, :meeting_id
  end
end
