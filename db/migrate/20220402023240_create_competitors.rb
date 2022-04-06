class CreateCompetitors < ActiveRecord::Migration[6.1]
  def change
    create_table :competitors do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
