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
    (self.speed * GAME_LENGTH)
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

  def name_with_info
    "#{self.name} | Speed: #{self.speed} | Hit%: #{self.accuracy} | Price: #{self.price}"
  end

  private

  def set_defaults
    #makes player price related but not equal to their value
    self.speed = rand(SPEED_VARIATION * 2) + (SPEED_AVG - SPEED_VARIATION)
    self.accuracy = rand(ACCURACY_VARIATON * 2) + (ACCURACY_AVG - ACCURACY_VARIATON)
    self.price = ((((self.speed * self.accuracy) * GAME_LENGTH)/100) * (100-(PRICE_ADJUST/2) + (rand(0..PRICE_ADJUST))))/100
    #                     value                     per game  normalize    %base                 %variation     normalize
  end

end
