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

  def create
    @proposal_date = ProposalDate.new()
    @proposal_date.meeting_id = params[:meeting_id]
    @proposal_date.date = params['proposal_date']['date']
    @attender_ids = Participation.find_all_by_meeting_id(params[:meeting_id]).collect {|p| p.user_id}
    puts "RRRRRRRRRRRRRRRRRRRRRRRR #{@attender_ids}"
    respond_to do |format|
      if @proposal_date.save
	SendDateMailer.deliver_meeting_date_proposal_email(@attender_ids, @current_user.id, params[:meeting_id], @proposal_date.date)
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