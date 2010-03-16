require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20100315160752
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  crypted_password  :string(255)     not null
#  current_login_ip  :string(255)
#  email             :string(255)
#  last_login_ip     :string(255)
#  login             :string(255)     not null
#  login_count       :integer(4)      not null, default(0)
#  name              :string(255)
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#  phone             :string(255)
#  created_at        :datetime
#  current_login_at  :datetime
#  last_login_at     :datetime
#  last_request_at   :datetime
#  updated_at        :datetime