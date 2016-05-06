class RemoveTeamFromEnvironments < ActiveRecord::Migration
  def change
    remove_reference :environments, :team, index: true, foreign_key: true
  end
end
