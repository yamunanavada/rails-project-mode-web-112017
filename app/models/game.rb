class Game < ApplicationRecord
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  has_many :scores
  has_many :players, through: :scores
  #validate less_than_2_games_played?


  #validation that the team and opponent have either never played or only played once
  def less_than_2_games_played?
    num_of_games = Game.all.where(team: self, opponent: opponent).count
    num_of games < 2
  end



end
