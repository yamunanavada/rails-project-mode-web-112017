class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players
  has_many :games
  has_many :opponents, through: :games, foreign_key: 'opponent_id'
  validate :max_players
  # validate :can_buy_players?
  #validate that team has money




  def max_players
    if self.players.count > 11
      errors.add(:team_player, "You already have 11 players on your team.")
      #this error isnt showing up
    end #team can only have 11 players maximum
  end

  # def can_buy_players?
  #   if self.war_chest <=0
  #     errors.add(:team_player, "Your team is broke. No money in the war chest.")
  #   end
  # end
  # # def user_already_has_team_in_league?
  # #   if self.user.teams(find)
  # #
  # # end
  # def buy_player(player_cost)
  #   self.war_chest -= player_cost
  # end

  def available_opponents
    #This method should find the opponents that a given team has either played once or not at all in a league.
    # dup = array.select{|element| array.count(element) <= 1
    teams_in_league = self.league.teams
    teams_in_league.select do |team|
      #should only return those opponents whose games played wiht self is 1 or 0.
      self.games.where(opponent_id: team.id).count < 2 && team != self
    end
  end



end
