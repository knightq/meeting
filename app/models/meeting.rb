class Meeting < ActiveRecord::Base
  has_many :proposal_dates, :dependent => :delete_all
  has_and_belongs_to_many :attenders
  has_one :organizator, :class_name => "Attender", :dependent => :nullify
  validates_presence_of :title, :body
  validates_uniqueness_of :title, :message => 'un''altro evento è presente con la stesso titolo.'
end
