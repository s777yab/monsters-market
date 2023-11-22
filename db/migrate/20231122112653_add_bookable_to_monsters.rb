class AddBookableToMonsters < ActiveRecord::Migration[7.1]
  def change
    add_column :monsters, :bookable, :boolean
  end
end
