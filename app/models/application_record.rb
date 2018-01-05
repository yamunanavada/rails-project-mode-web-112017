class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #must reseed players if you change any of the constants below
  GAMELENGTH = 10
  PRICEADJUST = 30 # the % variation between a player's value and price

  
  TEAMSIZE = 10
end
