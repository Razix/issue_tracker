class StatusesController < ApplicationController
  respond_to :html, :json

  def new
    @status = Status.new
    session[:return_to] = request.referer
  end

  def create
    @status = Status.new(params[:status])
    if @status.save && session[:return_to]
      redirect_to session[:return_to]
    else
      respond_with @status
    end
  end

  def show
    @status = Status.find(params[:id])
    respond_with @status
  end

end
