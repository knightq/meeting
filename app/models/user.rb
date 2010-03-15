class User < ActiveRecord::Base

  acts_as_authentic #do |c|
#    c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
#  end # block optional

  has_many :participations
  has_many :meetings, :through => :participations

  validates_presence_of :name, :email
  validates_uniqueness_of :email
    
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
end
