class ProposalDateUsersController < ApplicationController
  before_filter :require_user
  # POST /proposal_date_users
  # POST /proposal_date_users.xml
  def create
    @proposal_date_user = ProposalDateUser.new
    @proposal_date_user.user_id = params[:user_id]
    @proposal_date_user.proposal_date_id = params[:proposal_date_id]

    respond_to do |format|
      if @proposal_date_user.save
        format.html { redirect_to(:controller => 'proposal_dates', :meeting_id => params[:meeting_id]) }
        format.xml  { render :xml => @proposal_date_user, :status => :created, :location => @proposal_date_user }
      else
        flash[:error] = 'Problemi.'
        format.html { redirect_to(:controller => 'proposal_dates', :meeting_id => params[:meeting_id]) }
        format.xml  { render :xml => @proposal_date_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_date_users/1
  # DELETE /proposal_date_users/1.xml
  def destroy
    @proposal_date_user = ProposalDateUser.find_by_user_id_and_proposal_date_id(params[:user_id], params[:proposal_date_id])
    @proposal_date_user.destroy
    
    respond_to do |format|
      format.html { redirect_to(:controller => 'proposal_dates', :meeting_id => params[:meeting_id]) }
      format.xml  { head :ok }
    end
  end

end
