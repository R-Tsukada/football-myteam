class AddFixtureIdToMatches < ActiveRecord::Migration[7.2]
  def change
    add_column :matches, :fixture_id, :integer
  end
end
