class AttendersController < ApplicationController
  # GET /attenders
  # GET /attenders.xml
  def index
    @attenders = Attender.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attenders }
    end
  end

  # GET /attenders/1
  # GET /attenders/1.xml
  def show
    @attender = Attender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attender }
    end
  end

  # GET /attenders/new
  # GET /attenders/new.xml
  def new
    @attender = Attender.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attender }
    end
  end

  # GET /attenders/1/edit
  def edit
    @attender = Attender.find(params[:id])
  end

  # POST /attenders
  # POST /attenders.xml
  def create
    @attender = Attender.new(params[:attender])

    respond_to do |format|
      if @attender.save
        flash[:notice] = 'Attender was successfully created.'
        format.html { redirect_to(@attender) }
        format.xml  { render :xml => @attender, :status => :created, :location => @attender }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attenders/1
  # PUT /attenders/1.xml
  def update
    @attender = Attender.find(params[:id])

    respond_to do |format|
      if @attender.update_attributes(params[:attender])
        flash[:notice] = 'Attender was successfully updated.'
        format.html { redirect_to(@attender) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attenders/1
  # DELETE /attenders/1.xml
  def destroy
    @attender = Attender.find(params[:id])
    @attender.destroy

    respond_to do |format|
      format.html { redirect_to(attenders_url) }
      format.xml  { head :ok }
    end
  end
end
