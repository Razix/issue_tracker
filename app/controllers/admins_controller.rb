class AdminsController < ApplicationController
  respond_to :html, :json

  def new
    @admin = Admin.new
    respond_with @admin
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      sign_in @admin
      flash[:success] = 'Thanks for signing up!'
    end
    respond_with @admin, location: root_path
  end
end
