#require 'plugins/calendar'
class MeetingsController < ApplicationController
  def index
   @meetings = Meeting.all
  end

  def add_to_cart
    meeting = Meeting.find(params[:id])
    @cart = find_cart
    @cart.add_meeting(meeting)
  rescue ActiveRecord::RecordNotFound
    logger.error("Tentato accesso a meeting non valido #{params[:id]}" )
    flash[:notice] = "Meeting non valido"
    redirect_to :action => 'index'
  end
p
  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    @model = Meeting.find(params[:id])
    @meeting = Meeting.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # PUT /meetings/1
  # PUT /meetings/1.xml
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        flash[:notice] = 'Meeting aggiornato con successo.'
        format.html { redirect_to(@meeting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /meetings
  # POST /meetings.xml
  def create
    @meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @meeting.save
        flash[:notice] = 'Meeting creato con successo.'
        format.html { redirect_to(@meeting) }
        format.xml  { render :xml => @meeting, :status => :created, :location => @meeting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /meetings/new
  # GET /meetings/new.xml
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

private
  def find_cart
    session[:cart] ||= Cart.new
  end

end
