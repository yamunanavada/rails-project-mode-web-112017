class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    #- 


  end

  def create
    @game = Game.new(game_params)
    @inverse_game = Game.new(team_id: game_params[:opponent_id], opponent_id: game_params[:team_id])

    # @opponents ==> This needs to be a collection of opponents that the current team has either played once or not at all.
    if @game.valid? && @inverse_game.valid?
      @game.save && @inverse_game.save
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
