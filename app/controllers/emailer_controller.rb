class EmailerController < ApplicationController

  def send_mail
    if params[:type] == 'unstable'
    	SendDateMailer.deliver_meeting_date_unstable_email(params[:attender_ids], params[:meeting_id], params[:date])
    elsif params[:type] == 'fixed'
    	SendDateMailer.deliver_meeting_date_fixed_email(params[:attender_ids], params[:meeting_id], params[:date])
    else
    	SendDateMailer.deliver_meeting_date_proposal_email(params[:proposer_id], params[:meeting_id], params[:date])
    end
    respond_to do |format|
      flash[:notice] = 'Mail invitate.'
      format.html { redirect_to(:controller => 'proposal_dates', :action => 'index', :meeting_id => params[:meeting_id]) }
    end
  end

end
