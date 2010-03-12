class Attender < ActiveRecord::Base
  include SimplestAuth::Model   
  authenticate_by :email

  has_many :participations
  has_many :meetings, :through => :participations

  validates_presence_of :name, :email
  validates_uniqueness_of :email
    
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => :password_required?
end
