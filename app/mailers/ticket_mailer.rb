class TicketMailer < ActionMailer::Base
  default from: "Support Issue Tracking"

  def ticket_submission(ticket)
    @ticket = ticket
    @ticket_url  = ticket_url(@ticket)
    mail(:to => "#{ticket.name} <#{ticket.email}>", 
         :subject => "Ticket #{@ticket.unique_reference} has been created!")
  end
end
