class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :scores
  has_many :games, through: :scores
  has_many :leagues, through: :teams

  before_create :set_defaults

  # def teams_available(user)
  #   user_teams = Team.all.select {|t| user == t.user} #users teams
  #   available_teams = user_teams.select do |t| #select user's teams where
  #     t.league.teams.none? do |lt| # user's team's league has no teams where
  #       lt.players.any? do |p| #league's team's players have no player where
  #         p == self #player is the selected player
  #       end
  #     end
  #   end
  # end

  def thrown
    (self.speed * 60)
  end

  def hits
    (self.thrown * self.accuracy)/100
  end

  def teams_available(user)
    available_teams = user.teams.select do |team|
      leagues_available.include? team.league
    end
  end

  def leagues_available
    League.all.select do |league|
      !self.leagues.include? league
    end
  end

  private

  def set_defaults
    #makes player price related but not equal to their value
    self.speed = rand(10) + 5
    self.accuracy = rand(60) + 20
    self.price = ((((self.speed * self.accuracy) * GAMELENGTH)/100) * (100-(PRICEADJUST/2) + (rand(0..PRICEADJUST))))/100
    #                     value                     per game  normalize    %base                 %variation     normalize
  end

end
