class AddAPIToLeagues < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :api_id, :integer
  end
end
