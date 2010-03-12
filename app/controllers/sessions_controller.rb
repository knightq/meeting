class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
    flash[:notice] = 'Benvenuto!'
    redirect_to home_path
  end

  def destroy
    reset_session 
    flash[:notice] = 'Scollegato con successo'
    redirect_to login_path
  end

end

