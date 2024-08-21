class RemoveColumnsFromMatches < ActiveRecord::Migration[7.2]
  def change
    remove_column :matches, :team_id, :integer
    remove_column :matches, :team_name, :string
    remove_column :matches, :team_logo, :string
  end
end
