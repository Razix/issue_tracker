class Status < ActiveRecord::Base
  attr_accessible :value
  validates :value, presence: :true, uniqueness: { case_sensitive: false }
  has_many :tickets
end
