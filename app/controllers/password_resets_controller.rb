class PasswordResetsController < ApplicationController
 def new
   render
 end

 def create
   @user = User.find_by_email(params[:email])
   if @user
     @user.deliver_password_reset_instructions!
     flash[:notice] = "Ti sono state inviate per email le istruzioni per resettare la tua password. " +
                      "Controlla la posta."
     redirect_to root_url
   else
     flash[:notice] = "No user was found with that email address"
     render :action => :new
   end
 end

end
