class Meeting < ActiveRecord::Base
  has_many :proposal_dates, :dependent => :delete_all
  has_many :participations, :dependent => :delete_all
  has_many :presentations, :dependent => :delete_all
  has_many :attenders, :through => :participations
  belongs_to :organizator, :class_name => "User", :dependent => :delete, :foreign_key => "organizator"
  validates_presence_of :title, :body
  validates_uniqueness_of :title, :message => 'un''altro evento è presente con la stesso titolo.'
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
