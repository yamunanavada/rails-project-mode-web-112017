class League < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :players, through: :teams
  validate :is_league_full?

  def is_league_full?

    if self.teams.count > LEAGUE_SIZE
      errors.add(:league, "is already full.")
    end
  end

  def games
    self.teams.map do |team|
      team.games.map do |game|
        game
      end
    end.flatten
  end

  def players_available
    Player.all.select do |player|
      !self.players.include? player
    end
  end

end
