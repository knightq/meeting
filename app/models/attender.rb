class Attender < ActiveRecord::Base
#  include SimplestAuth::Model   
#  authenticate_by :email

  has_many :participations
  has_many :meetings, :through => :participations

  validates_presence_of :name, :email
  validates_uniqueness_of :email
    
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => :password_required?
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