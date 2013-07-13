class Status < ActiveRecord::Base
  attr_accessible :value
  validates :value, presence: :true
  has_many :tickets
end
