class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.valid?
      @game.save
      redirect_to game_path(@game)
    else
      flash[:error] = @game.errors.full_messages
      redirect_to new_game_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:team_id, :opponent_id)
  end

end
