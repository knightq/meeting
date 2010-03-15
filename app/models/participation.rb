class Participation < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :user

  def self.find_attenders_for(meeting_id)
    participations_to_meeting = Participation.find(:all, :include => [ :meeting, :user ], :conditions => ['meeting_id = ?', meeting_id])
    attenders = []
    participations_to_meeting.each { |p| attenders << p.user }
    attenders.sort! {|x,y| x.name <=> y.name }
  end

end
