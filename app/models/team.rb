class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players
  has_many :games
  has_many :opponents, through: :games, foreign_key: 'opponent_id'

  has_many :friends, through: :friendships, :foreign_key => 'friend_id'


end
