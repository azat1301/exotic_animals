class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :species
      t.string :rarity_level
      t.string :sex
      t.integer :age
      t.string :diet
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
