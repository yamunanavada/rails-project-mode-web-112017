class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players
  has_many :games
  has_many :opponents, through: :games, foreign_key: 'opponent_id'

  def available_opponents
    #This method should find the opponents that a given team has either played once or not at all in a league.
    # dup = array.select{|element| array.count(element) <= 1 }

    teams_in_league = self.league.teams
    self.games.map do |game|



    end


  end


end
