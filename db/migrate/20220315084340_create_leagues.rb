class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :logo, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
