class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_username(params[:session][:username].downcase)
    if admin && admin.authenticate(params[:session][:password])
      sign_in admin
      flash[:success] = "Welcome back, #{admin.username}!"
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid username or password...'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
