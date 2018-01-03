class League < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  validate :is_league_full?

  def is_league_full?
    if self.teams.count > 10
      errors.add(:team, "This league is full.")
    end
  end

end
