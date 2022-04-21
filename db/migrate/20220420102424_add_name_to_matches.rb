class AddNameToMatches < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :home_team_name, :string
    add_column :matches, :away_team_name, :string
    add_column :matches, :home_logo, :string
    add_column :matches, :away_logo, :string
  end
end
