class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.integer :api_id, null: false, index: { unique: true }
      t.string :name, null: false, index: { unique: true }
      t.string :logo, null: false, index: { unique: true }
      t.string :home_city, null: false
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
