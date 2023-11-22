class AddCoordinatesToMonsters < ActiveRecord::Migration[7.1]
  def change
    add_column :monsters, :latitude, :float
    add_column :monsters, :longitude, :float
  end
end
