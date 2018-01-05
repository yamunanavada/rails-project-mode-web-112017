class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #must drop all tables but users and reseed players if you change any of the constants below
  GAME_LENGTH = 10

  PRICE_ADJUST = 30 # the % variation between a player's value and price
  PLAYER_DEPRECIATION = 10 # the % of player price lost when selling a player back
  SPEED_AVG = 10
  SPEED_VARIATION = 5
  ACCURACY_AVG = 50
  ACCURACY_VARIATON = 30


  TEAM_SIZE = 10
  TEAM_PRICE_AVG = (SPEED_AVG * ACCURACY_AVG * TEAM_SIZE)/10
  STARTING_BONUS = TEAM_PRICE_AVG/5

end
