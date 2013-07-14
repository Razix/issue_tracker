class Comment < ActiveRecord::Base
  attr_accessible :reply
  belongs_to :ticket
  belongs_to :admin
end
