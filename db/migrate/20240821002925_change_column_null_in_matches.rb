class ChangeColumnNullInMatches < ActiveRecord::Migration[7.2]
  def change
    change_column_null :matches, :home_team_name, false
    change_column_null :matches, :away_team_name, false
    change_column_null :matches, :home_logo, false
    change_column_null :matches, :away_logo, false
  end
end
