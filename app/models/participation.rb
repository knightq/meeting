class Participation < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :attender
end
