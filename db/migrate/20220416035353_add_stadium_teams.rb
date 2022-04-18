class AddStadiumTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :stadium, :string
  end
end
