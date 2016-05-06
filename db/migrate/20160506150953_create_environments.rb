class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.string :om_version
      t.string :image
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
