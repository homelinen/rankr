class Match < ActiveRecord::Base
  belongs_to :tournament
  has_many :awards

  attr_accessible :game, :name, :start, :duration, :tournament_id

  validates_presence_of :game, :tournament_id

  def p_duration
    "#{duration/60}:#{"%02d" % (duration % 60)}" 
  end

  # Total the scores by username
  def total_scores
    awards.order('amount DESC').group(:username).sum(:amount)
  end

  # Get the winner(s) for the match
  #
  # Returns an array of winners or a singleton array for a clear winner
  def winner

    if awards.count > 0
      scores = total_scores

      # Find the top scores
      top_score = scores.select { |k,v| v == scores.first[1] }

      top_score.keys
    end

  end
end
