class SendDateMailer < ActionMailer::Base
 
  def meeting_date_fixed_email(attender_ids, meeting_id, date)
        @meeting = Meeting.find(meeting_id)
	@attenders = User.find(:all, :conditions => ['id in (?)', attender_ids])
	@date = date
	puts "============= ATTENDER_IDS = #{attender_ids}"
	puts "============= @ATTENDERS.SIZE = #{@attenders.size}"
	title = @meeting.title if @meeting
	emails = @attenders.collect {|u| u.email}
	puts "============= EMAILS = #{emails}"
	puts "Email mandate a #{emails.each do |e| e.to_s end}"
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
	puts "============= ATTENDER_IDS = #{attender_ids}"
	puts "============= @ATTENDERS.SIZE = #{@attenders.size}"
	title = @meeting.title if @meeting
	emails = @attenders.collect {|u| u.email}
	puts "============= EMAILS = #{emails}"
	puts "Email mandate a #{emails.each do |e| e.to_s end}"
	recipients emails
#	recipients "asalicetti@kion.it"
	from "KION Meeting Planner <asalicetti@kion.it>"
	subject "Meeting [#{title}] fissato per il #{date}"
        sent_on Time.now 
	body {
	}
  end 

  def meeting_date_proposal_email(attender_ids, proposer_id, meeting_id, date, pdate_id)
        @meeting = Meeting.find(meeting_id)
	@attenders = User.find(:all, :conditions => ['id in (?)', attender_ids])
	@proposer = User.find(proposer_id)
	@date = date
	title = @meeting.title if @meeting
	emails = @attenders.collect {|u| u.email}
	puts "Email mandate a #{emails.each do |e| e.to_s end}"
	emails = User.find(:all, :conditions => ['id in (?)', attender_ids]).collect {|u| u.email}
        attachment :content_type => "text/calendar; name='evento.ics'",
		:body => ical(pdate_id), 
		:disposition => 'attachment; filename=evento.ics',
		:filename => "evento.ics",
		:transfer_encoding => "7bit" 
	recipients emails
#	recipients "asalicetti@kion.it"
	from "KION Meeting Planner <asalicetti@kion.it>"
	subject "Meeting [#{title}] proposto per il #{date}"
        sent_on Time.now 
	body {}
	transfer_encoding = "7bit"

  end 

  def ical(pdate_id)
    @proposal_date = ProposalDate.find(pdate_id)
    @meeting = Meeting.find(@proposal_date.meeting_id)
    @calendar = Icalendar::Calendar.new
    event = Icalendar::Event.new
    event.start = @proposal_date.date.strftime("%Y%m%dT%H%M%S")
    event.end = (@proposal_date.date.to_time + @meeting.duration.hours).to_datetime.strftime("%Y%m%dT%H%M%S")
    event.summary = @meeting.title
    event.description = @meeting.body
    event.location = "Sala corsi" #@event.location
    @calendar.add event
    @calendar.publish
    headers['Content-Type'] = "text/calendar; charset=UTF-8"
#    render :text => @calendar.to_ical, :layout => false
    @calendar.to_ical
  end

end
