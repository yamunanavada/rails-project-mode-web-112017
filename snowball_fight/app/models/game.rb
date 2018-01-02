class Game < ApplicationRecord
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  has_many :scores
  has_many :players, through: :scores

end
