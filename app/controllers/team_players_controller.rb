class TeamPlayersController < ApplicationController

def create
  if team_player_params[:team_id] == ""
    flash[:error] = "You did not select a team that is available."
    redirect_to players_path
  else
    @team_player = TeamPlayer.new(team_player_params)
    @player = Player.find(team_player_params[:player_id])
    @team = Team.find(team_player_params[:team_id])
    @team.buy_player(@player.price)

    if @team_player.valid? && @team.valid?
      @team_player.save
      @team.save
      redirect_to team_path(@team)
    else
      flash[:error] = @team_player.errors.full_messages + @team.errors.full_messages
      redirect_to player_path(Player.find(team_player_params[:player_id]))
    end
  end
end

def destroy
  @team_player = TeamPlayer.find(params[:format])
  @team = @team_player.team
  @team.sell_player(@team_player.player.price)
  @team.save
  @team_player.destroy
  redirect_to team_path(@team)
end

private

def team_player_params
  params.require(:team_player).permit(:team_id, :player_id)
end

end
