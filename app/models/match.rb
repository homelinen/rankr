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
end
