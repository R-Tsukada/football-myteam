class AddActiveToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :active, :boolean, default: true, null: false
  end
end
