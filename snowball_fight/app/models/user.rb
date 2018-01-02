class User < ApplicationRecord
  has_many :teams
  has_many :leagues, through: :teams
  has_secure_password
  

end
