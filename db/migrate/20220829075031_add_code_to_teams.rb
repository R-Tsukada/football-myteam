class AddCodeToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :code, :string
  end
end
