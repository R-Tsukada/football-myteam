class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :team_matches_index
      t.string :season, null: false
      t.date :date, null: false
      t.string :competition_name, null: false
      t.string :competition_logo, null: false
      t.string :team_name, null: false
      t.string :team_logo, null: false
      t.string :home_score
      t.string :away_score
      t.string :home_and_away, null: false

      t.timestamps
    end
  end
end
