class Game < ApplicationRecord
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  has_many :scores
  has_many :players, through: :team
  has_many :players, through: :opponent
  #validate less_than_2_games_played?


  #validation that the team and opponent have either never played or only played once

  # def less_than_2_games_played?
  #   num_of_games = Game.all.where(team: self, opponent: opponent).count
  #   num_of games < 2
  # end

  #method something to add calculate final score of game and winner

  def generate_team_scores(team)
    team.players.each do |player|
      Score.create(game_id: self.id, player_id: player.id, balls_thrown: player.thrown, hits_given: player.hits)
    end
  end

  def aggregate_scores
    (self.team.hits(self) - self.opponent.hits(self)).abs
  end



  def generate_winner(team, opponent)
    if team.hits(self) - opponent.hits(self) > 0
      team
    elsif team.hits(self) - opponent.hits(self) < 0
      opponent
    else
      nil
    end
  end

end
