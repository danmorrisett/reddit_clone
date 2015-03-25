class AuthenticationController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Welcome to the Machine'
      redirect_to root_path
    else
      render :new
    end
  end




end
