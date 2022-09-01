class AddColumnsToMatches < ActiveRecord::Migration[6.1]
  def change
    add_reference :matches, :team, foreign_key: true
  end
end
