class SendDateMailer < ActionMailer::Base
 
  def meeting_date_fixed_email(attender_ids, meeting_id, date)
        @meeting = Meeting.find(meeting_id)
	@attenders = User.find(:all, :conditions => ['id in (?)', attender_ids])
	@date = date
	title = @meeting.title if @meeting
	emails = User.find(attender_ids).collect {|u| u.email}
	recipients emails
#	recipients "asalicetti@kion.it"
	from "KION Meeting Planner <asalicetti@kion.it>"
	subject "Meeting [#{title}] fissato per il #{date}"
        sent_on Time.now 
	body {
	}
  end 

  def meeting_date_unstable_email(attender_ids, meeting_id, date)
        @meeting = Meeting.find(meeting_id)
	@attenders = User.find(:all, :conditions => ['id in (?)', attender_ids])
	@date = date
	title = @meeting.title if @meeting
	puts "#{attender_ids}"
	emails = User.find(attender_ids).collect {|u| u.email}
	recipients emails
#	recipients "asalicetti@kion.it"
	from "KION Meeting Planner <asalicetti@kion.it>"
	subject "Meeting [#{title}] fissato per il #{date}"
        sent_on Time.now 
	body {
	}
  end 

  def meeting_date_proposal_email(attender_ids, proposer_id, meeting_id, date)
        @meeting = Meeting.find(meeting_id)
	@proposer = User.find(proposer_id)
	@date = date
	title = @meeting.title if @meeting
	puts "#{attender_ids}"
	emails = User.find(attender_ids).collect {|u| u.email}
	recipients emails
#	recipients "asalicetti@kion.it"
	recipients "asalicetti@kion.it"
	from "KION Meeting Planner <asalicetti@kion.it>"
	subject "Meeting [#{title}] proposto per il #{date}"
        sent_on Time.now 
	body {
	}
  end 

end