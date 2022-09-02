class RemoveTeamMatchesIndexFromMatches < ActiveRecord::Migration[6.1]
  def change
    remove_column :matches, :team_matches_index, :integer
  end
end
