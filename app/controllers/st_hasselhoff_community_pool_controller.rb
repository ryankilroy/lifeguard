class StHasselhoffCommunityPoolController < ApplicationController
  def index
    @ready_envs = []
    @grounded_envs = []
    @redeploy_envs = []
    @claimed_envs = []
  end
end
