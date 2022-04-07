class CreateStandings < ActiveRecord::Migration[6.1]
  def change
    create_table :standings do |t|
      t.references :team, foreign_key: true
      t.string :team_name, null: false
      t.string :team_logo, null: false
      t.integer :rank, null: false
      t.integer :points, null: false
      t.integer :played, null: false

      t.timestamps
    end
  end
end
