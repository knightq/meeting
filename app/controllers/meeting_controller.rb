#require 'plugins/calendar'
class MeetingController < ApplicationController
  def index
   @meetings = Meeting.all
  end

  def show
   @model = Meeting.find(params[:id])
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


private
  def find_cart
    session[:cart] ||= Cart.new
  end

end
