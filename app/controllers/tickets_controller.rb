class TicketsController < ApplicationController
  respond_to :html, :json

  def new
    @ticket = Ticket.new
    respond_with @ticket
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    flash[:success] = 'Ticket was successfully created!' if @ticket.save
    respond_with @ticket
  end

  def show
    @ticket = Ticket.find(params[:id])
    respond_with @ticket
  end
end
