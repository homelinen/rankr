class Tournament < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :start

  validates_presence_of :name, :user

  validates_associated :user
end
