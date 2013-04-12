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

  # Get a list of participants and their scores
  #
  # Returns an containing [name, num_wins]
  def results

    result_list = {}

    matches.each do |match|
      if match.winner
        match.winner.each do |winner|
          name = winner

          count = 1
          count = result_list[name] + 1 if result_list[name]

          result_list.merge!({ winner => count})    
        end
      end
    end

    result_list.to_a.sort { |a, b| -( a[1] <=> b[1] ) }
  end
end
