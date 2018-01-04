class GamesController < ApplicationController


  def show
    @game = Game.find(params[:id])
    @team = Team.find(@game.team.id)
    @opponent = Team.find(@game.opponent.id)
  end

  def new
    @game = Game.new

  end

  def create
    @game = Game.new(game_params)
    # @inverse_game = Game.new(team_id: game_params[:opponent_id], opponent_id: game_params[:team_id])
    #instead of doing inverse game...
    # && @inverse_game.valid?
    if @game.valid?


      @game.save
      @game.generate_team_scores(Team.find(game_params[:team_id]))
      @game.generate_team_scores(Team.find(game_params[:opponent_id]))
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
