class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.new(params[:comment])
    staff_response = Status.where(value: 'Waiting for Staff Response').first
    customer_response = Status.where(value: 'Waiting for Customer').first
    if current_admin
      TicketMailer.ticket_updated(@ticket, @comment).deliver
      @comment.admin = current_admin
      @ticket.admin = current_admin
      @ticket.status = customer_response
    else
      @ticket.status = staff_response
    end
    @ticket.save
    @comment.save
    redirect_to ticket_path(@ticket)
  end
end
