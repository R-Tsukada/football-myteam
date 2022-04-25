class AddRankToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :last_season_rank, :integer
  end
end
