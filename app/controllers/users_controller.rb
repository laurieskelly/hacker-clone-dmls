class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to "/"
    else
      redirect_to "/users/new"
    end
  end
end #UsersController

