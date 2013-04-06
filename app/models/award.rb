class Award < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  attr_accessible :amount, :user, :match_id, :username
end
