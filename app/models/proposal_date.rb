class ProposalDate < ActiveRecord::Base
  belongs_to :meeting

  def self.find_dates_for(meeting_id)
    dates = []
    dates + ProposalDate.find(:all, :conditions => ['meeting_id = ?', meeting_id])
  end

end
