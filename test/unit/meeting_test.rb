require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20100315160752
#
# Table name: meetings
#
#  id          :integer(4)      not null, primary key
#  body        :text
#  date        :date
#  duration    :integer(4)
#  end_time    :time
#  image_url   :string(255)
#  organizator :integer(4)
#  start_time  :time
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime