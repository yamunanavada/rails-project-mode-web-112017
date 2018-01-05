class PlayersController < ApplicationController


  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @team_player = TeamPlayer.new()
    @user = current_user
    @available_teams = @player.teams_available(@user)
    @teams = Team.find_by(user: current_user)
  end


  private
  #
  # def player_params
  #   params.require(:player).permit(:name, :user_id, :league_id)
  # end

end
