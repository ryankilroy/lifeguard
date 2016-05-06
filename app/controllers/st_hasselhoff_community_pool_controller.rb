class StHasselhoffCommunityPoolController < ApplicationController
  def index
    @ready_envs = []
    @grounded_envs = []
    @redeploy_envs = []
    @claimed_envs = []
  end

  def show
    @env = nil
  end
end
