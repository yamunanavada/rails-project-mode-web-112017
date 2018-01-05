class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players
  has_many :games
  has_many :opponents, through: :games, foreign_key: 'opponent_id'
  has_many :scores, through: :games
  validate :max_players
  validate :can_buy_players?
  #validate that team has money


  def thrown(game)
    thrown = 0
    self.players.map do |player|
      player.scores.select {|s| s.game == game}.each do |s|
        thrown += s.balls_thrown
      end
    end
    thrown
  end

  def hits(game)
    hits = 0
    self.players.map do |player|
      player.scores.select {|s| s.game == game}.each do |s|
        hits += s.hits_given
      end
    end
    hits
  end


  def win_game(prize_money)
    self.war_chest = self.war_chest + prize_money
    self.save
    #test this once scores are in place
  end

  def max_players
    if self.players.count > TEAMSIZE
      errors.add(:team, "has #{TEAMSIZE} players already.")
    end #team can only have TEAMSIZE players maximum
  end

  def can_buy_players?
    #no money in the bank
    if self.war_chest <=0
      errors.add(:team, "is broke. No money in the war chest.")
      #this message isnt showing up either
    end
  end

  def buy_player(player_cost)
    self.war_chest = self.war_chest - player_cost
  end

  def sell_player(player_cost)
    self.war_chest = self.war_chest + (player_cost * (100 - PLAYERDEPRECIATON)/100)
  end

  def available_opponents
    #This method should find the opponents that a given team has either played once or not at all in a league.
    teams_in_league = self.league.teams
    teams_in_league.select do |team|
      #should only return those opponents whose games played wiht self is 1 or 0.
      team.games.where(team_id: self.id, opponent_id: team.id).count < 2 && team.games.where(team_id: team.id, opponent_id: self.id).count < 2 && team != self
    end
  end



end
