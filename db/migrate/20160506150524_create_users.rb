class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :gitname
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
