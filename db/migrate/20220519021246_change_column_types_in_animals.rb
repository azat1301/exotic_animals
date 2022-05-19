class ChangeColumnTypesInAnimals < ActiveRecord::Migration[6.1]
  def change
    remove_column :animals, :sex
    remove_column :animals, :rarity_level
    add_column :animals, :rarity_level, :integer
    add_column :animals, :sex, :integer
  end
end
