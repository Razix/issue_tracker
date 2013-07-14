class Ticket < ActiveRecord::Base
  attr_accessible :body, :email, :issue, :name, :subject, :unique_reference, :status_id, :admin_id

  ISSUE = [['General'], ['Account'], ['Billing'], ['Technical']]
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true, length: { maximum: 70 }
  validates :body, presence: true, length: { minimum: 30 }

  before_create :generate_unique_reference, :default_status
  after_create :send_confirmation

  extend FriendlyId
  friendly_id :unique_reference

  belongs_to :status
  belongs_to :admin
  has_many :comments, dependent: :destroy

  def generate_unique_reference
    self.unique_reference = loop do
      random_unique_reference = "#{(1..3).map{(65 + rand(26)).chr}.join}-#{'%06d' % rand(1000000)}"
      break random_unique_reference unless Ticket.where(unique_reference: random_unique_reference).exists?
    end
  end

  def default_status
    self.status = Status.where(value: 'Waiting for Staff Response').first
  end

  def send_confirmation
    TicketMailer.ticket_submission(self).deliver
  end

  def self.search(search)
    if search
      find(:all, conditions: ['name LIKE ? OR unique_reference LIKE ? OR body LIKE ?', 
                              "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.unassigned
    where(admin_id: nil)
  end

  def self.open
    find(:all, joins: :status, conditions: { statuses: { value: ['Waiting for Staff Response', 'Waiting for Customer'] } })
  end

  def self.hold
    find(:all, joins: :status, conditions: { statuses: { value: 'On Hold' } })
  end

  def self.closed
    find(:all, joins: :status, conditions: { statuses: { value: ['Cancelled', 'Completed'] } })
  end

end
