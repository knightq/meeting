require 'test_helper'

class ProposalDateTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20100315160752
#
# Table name: proposal_dates
#
#  id         :integer(4)      not null, primary key
#  meeting_id :integer(4)
#  date       :date
#  created_at :datetime
#  updated_at :datetime