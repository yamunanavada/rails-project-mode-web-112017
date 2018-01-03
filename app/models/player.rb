class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :scores
  has_many :games, through: :scores

  def teams_available(user)
    user_teams = Team.all.select {|t| user == t.user} #users teams
    available_teams = user_teams.select do |t| #select user's teams where
      t.league.teams.none? do |lt| # user's team's league has no teams where
        lt.players.any? do |p| #league's team's players have no player where
          p == self #player is the selected player
        end
      end
    end
  end
end
