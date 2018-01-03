class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :destroy, :update]

  def index
    @leagues = League.all
  end

  def show

  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.valid?
      @league.save
      redirect_to league_path(@league)
    else
      flash[:error] = @league.errors.full_messages
      redirect_to new_league_path
    end
  end

  def edit
  end

  def update
    if @league.update(league_params)
      redirect_to league_path(@league)
    else
      flash[:error] = @league.errors.full_messages
      redirect_to edit_league_path(@league)
    end
  end

  def destroy
    @league.delete
    redirect_to leagues_path
  end

  private

  def set_league
    @league = League.find(params[:id])
  end

  def league_params
    params.require(:league).permit(:name)
  end
end
