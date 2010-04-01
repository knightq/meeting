require 'icalendar'

class ProposalDatesController < ApplicationController
  before_filter :require_user
  # GET /proposal_dates/1
  # GET /proposal_dates/1.xml
  def index
    @meeting = Meeting.find(params[:meeting_id])
    @dates = ProposalDate.find_dates_for(params[:meeting_id])
    @attenders = Participation.find_attenders_for(params[:meeting_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proposal_date }
    end
  end

  def export_events
    @proposal_date = ProposalDate.find(params[:id])
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
    render :text => @calendar.to_ical, :layout => false
  end

  def create
    @proposal_date = ProposalDate.new()
    @proposal_date.meeting_id = params[:meeting_id]
    @proposal_date.date = params['proposal_date']['date']
    @attender_ids = Participation.find_all_by_meeting_id(params[:meeting_id]).collect {|p| p.user_id}
    puts "RRRRRRRRRRRRRRRRRRRRRRRR #{@attender_ids}"
    respond_to do |format|
      if @proposal_date.save
	SendDateMailer.deliver_meeting_date_proposal_email(@attender_ids, @current_user.id, params[:meeting_id], @proposal_date.date, @proposal_date.id)
        flash[:notice] = 'Invito accettato.'
        format.html { redirect_to(:action => 'index', :meeting_id => @proposal_date.meeting_id) }
        format.xml  { render :xml => @proposal_date, :status => :created, :location => @proposal_date }
      else
        flash[:notice] = 'Errore in creazione data.'
        format.html { redirect_to(:action => 'new', :meeting_id => @proposal_date.meeting_id) }
        format.xml  { render :xml => @proposal_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @meeting = Meeting.find(params[:meeting_id])
    @proposal_date = ProposalDate.new
    @proposal_date.meeting_id = params[:meeting_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposal_date }
    end
  end

end
