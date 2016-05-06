class AddFieldsToEnvironments < ActiveRecord::Migration
  def change
    add_column :environments, :iaas, :string
    add_column :environments, :ops_mgr_url, :string
    add_column :environments, :concourse_url, :string
    add_column :environments, :last_commit_timestamp, :timestamps
    add_column :environments, :last_commit_message, :string
    add_column :environments, :state, :string
  end
end
