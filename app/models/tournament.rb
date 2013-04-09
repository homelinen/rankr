class Tournament < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :start

  has_many :matches

  validates_presence_of :name, :user

  validates_associated :user

  def participants
    usernames = []

    Award.joins(:match).where(:matches => { 
                              :tournament_id => id }
             ).select(:username).uniq.each do |award|
               usernames.push award.username
             end

    usernames
  end
end
