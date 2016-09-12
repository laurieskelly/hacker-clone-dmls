class SessionsController < ApplicationController

  def new
    render :'pages/login'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:username] = params[:username]
      redirect_to '/'
    end
  end #create

  def destroy
    session.clear
    redirect_to '/'
  end #destroy


end #SessionsController

