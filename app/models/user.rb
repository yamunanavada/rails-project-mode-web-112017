class User < ApplicationRecord
  has_many :teams
  has_many :leagues, through: :teams
  has_secure_password
  validates :username, presence: true, uniqueness: true


  #What's in this user's war_chest
  def buy_players(player_cost)
    self.war_chest -= player_cost
  end

  #def win_game
  #end



end
