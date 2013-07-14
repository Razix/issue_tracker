class AdminsController < ApplicationController
  respond_to :html, :json

  def new
    @admin = Admin.new
    respond_with @admin
  end

  def create
    @admin = Admin.new(params[:admin])
    flash[:success] = 'Thanks for signing up!' if @admin.save
    respond_with @admin, location: root_path
  end
end
