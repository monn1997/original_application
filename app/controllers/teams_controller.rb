class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy] 

  def index
    @teams = Team.all
    if params[:my_team]
      @teams = current_user.assign_teams
    else
      @teams = Team.all
    end
  end
  
  def show
    @assign = current_user.assigns.find_by(team_id: @team.id)
    @members = @team.members
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path(params[:team_id]), notice: 'チームを作成しました'
    else
      flash[:alert] = '作成出来ませんでした'
      render :new
    end
  end
  
  def edit 
  end
  
  def update
    if @team.update(team_params)
      redirect_to teams_path
    else
      render "edit"
    end    
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.users.delete(current_user)
    redirect_to teams_path
  end

  private
  
  def set_team
    @team = Team.find(params[:id])
  end  
