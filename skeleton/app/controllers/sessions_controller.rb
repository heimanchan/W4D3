class SessionsController < ApplicationController
  before_action :require_logout, only: [:new, :create]

  def new 
    render :new 
  end 

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
    # don't forget to add VIEWS!!!!
  end 

  def destroy
    logout!
    redirect_to new_session_url
  end 


end 