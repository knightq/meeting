class ProposalDateUser < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20100315160752
#
# Table name: proposal_date_users
#
#  id               :integer(4)      not null, primary key
#  proposal_date_id :integer(4)
#  user_id          :integer(4)
#  created_at       :datetime
#  updated_at       :datetime