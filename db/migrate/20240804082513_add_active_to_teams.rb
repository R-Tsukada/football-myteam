class AddActiveToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :active, :boolean
  end
end
