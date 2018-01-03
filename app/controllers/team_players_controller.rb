class TeamPlayersController < ApplicationController

def create
  @team_player = TeamPlayer.new(team_player_params)
  if @team_player.valid?
    byebug
    @team_player.save
    redirect_to team_path(Team.find_by(team_player_params[:team_id]))
  else
    flash[:error] = @team_player.errors.full_messages
    redirect_to player_path(Player.find_by(team_player_params[:player_id]))
  end
end

private

def team_player_params
  params.require(:team_player).permit(:team_id, :player_id)
end

end
