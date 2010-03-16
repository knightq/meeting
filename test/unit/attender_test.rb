require 'test_helper'

class AttenderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20100315160752
#
# Table name: attenders
#
#  id               :integer(4)      not null, primary key
#  crypted_password :string(255)
#  email            :string(255)
#  name             :string(255)
#  phone            :string(255)
#  created_at       :datetime
#  updated_at       :datetime