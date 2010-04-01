class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
 
#  active_scaffold :user do |config|
#    config.label = "Utenti"
#    config.columns = [:login, :name, :email, :phone]
#    list.columns.exclude [:crypted_password]
#    list.sorting = {:name => 'ASC'}
#    columns[:phone].label = "Telefono #"
#    columns[:phone].description = "(Formato: 051-611###)"
#  end

  def new
      @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to :controller => 'meetings'
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      render :action => :edit
    end
  end

  def self.find_user(user_id)
    User.find(user_id)
  end

end
