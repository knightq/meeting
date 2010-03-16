require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20100315160752
#
# Table name: participations
#
#  id         :integer(4)      not null, primary key
#  meeting_id :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime