class Award < ActiveRecord::Base
  belongs_to :user
  belongs_to :tournament
  attr_accessible :amount, :user, :tournament_id, :username

  # Print the user name of the user
  def print_username
    if user and !user.username.empty?
      user.username
    else
      username
    end
  end
end
