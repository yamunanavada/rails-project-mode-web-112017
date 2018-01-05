class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #must reseed players if you change any of the constants below
  GAMELENGTH = 10
  PRICEADJUST = 30 # the % variation between a player's value and price
  PLAYERDEPRECIATON = 10 # the % of player price lost when selling a player back

  TEAMSIZE = 10
end
