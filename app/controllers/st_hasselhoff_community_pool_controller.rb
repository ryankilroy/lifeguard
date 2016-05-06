class StHasselhoffCommunityPoolController < ApplicationController
  def index
    @ready_envs =  Environment.where(state: 'ready')
    @grounded_envs = Environment.where(state: 'grounded')
    @redeploy_envs = Environment.where(state: 'redeploy')
    @claimed_envs = Environment.where(state: 'claimed')
    @teams = Team.all
  end

  def show
    @env = Environment.find_by(name: params[:name])
  end
end
