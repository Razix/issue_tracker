class Admin < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  before_save { username.downcase! }
  before_save :create_remember_token

  # username can contain only letters, underscores, hyphens and dots
  VALID_USERNAME_REGEX = /\A[a-z][a-z_.-]+\Z/i
  validates :username, presence: true, length: { minimum: 6, maximum: 30 },
            format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }

  has_many :tickets
  has_many :comments

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
