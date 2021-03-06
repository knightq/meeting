# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

  attr_accessor :calendar

#  include SimplestAuth::Controller
#  session :session_key => '_meeting_session_id'
#  helper_method :admin?

  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def require_user
    unless current_user
      #store_location
      flash[:notice] = "Devi essere autenticato per accedere a questa pagina"
      redirect_to home_path
      return false
    end
  end

  def require_no_user
    if current_user
      #store_location
      flash[:notice] = "Non devi essere autenticato per accedere a questa pagina"
      redirect_to root_url
      return false
    end
  end

  def redirect_back_or(path)
    redirect_to :back
    rescue ActionController::RedirectBackError
    redirect_to path
  end
protected
#  def authorize
#    unless admin?
#      flash[:notice] = "Accesso non autorizzato"
#      redirect_to home_path
#      false
#    end
#  end
#   Scrub sensitive parameters from your log
#   filter_parameter_logging :password
#  def admin?
#    session[:password] == "superadmin"
#  end

private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

end
