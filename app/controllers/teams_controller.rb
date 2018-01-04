class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :destroy, :update]



  def show
    @game = Game.new
    @opponents = @team.available_opponents
    @team_player = TeamPlayer.new
    @players = @team.league.players_available
  end

  def new
    @team = Team.new
    @leagues = League.all
  end

  def create
    byebug
    @team = Team.new(team_params)
    @team.user = User.find(session[:user_id])
    @team.war_chest = 100
    @league = League.find(team_params[:league_id])
    if @team.valid? && @league.valid?
      @team.save
      redirect_to team_path(@team)
    else
      flash[:error] = @team.errors.full_messages + @league.errors.full_messages
      redirect_to new_team_path
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      flash[:error] = @team.errors.full_messages
      redirect_to edit_team_path(@team)
    end
  end

  def destroy
    @team.delete
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :user_id, :league_id)
  end



end
