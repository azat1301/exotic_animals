class AddDatatypeDiet < ActiveRecord::Migration[6.1]
  def change
    remove_column :animals, :diet
    add_column :animals, :diet, :integer
  end
end
