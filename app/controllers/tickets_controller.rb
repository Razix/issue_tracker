class TicketsController < ApplicationController
  respond_to :html, :json

  before_filter :signed_in_admin, except: [:new, :create, :show]

  def index
    @tickets = Ticket.search(params[:search])
    if @tickets.size == 1
      redirect_to @tickets.first
    end
  end

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

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      flash[:success] = 'Ticket was updated!'
    end
    respond_with @ticket
  end

  def unassigned_tickets
    @tickets = Ticket.unassigned
  end

  def open_tickets
    @tickets = Ticket.open
  end

  def hold_tickets
    @tickets = Ticket.hold
  end

  def closed_tickets
    @tickets = Ticket.closed
  end

end
