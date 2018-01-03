class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :destroy, :update]


  def show

  end

  def new
    @team = Team.new
    @leagues = League.all
  end

  def create
    @team = Team.new(team_params)
    @team.user = User.find(session[:user_id])
    if @team.valid?
      @team.save
      redirect_to team_path(@team)
    else
      flash[:error] = @team.errors.full_messages
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
