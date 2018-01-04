class League < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  validate :is_league_full?

  def is_league_full?

    if self.teams.count > 10
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

end
