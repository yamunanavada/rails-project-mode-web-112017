class Score < ApplicationRecord
  belongs_to :player
  belongs_to :game

  def initalize(game_id: game_id, player_id: player_id, balls_thrown: balls_thrown, hits_given: hits_given)
    @game_id = game_id
    @player_id = player_id
    @balls_thrown = balls_thrown
    @hits_given = hits_given
  end


end
