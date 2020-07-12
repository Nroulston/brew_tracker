class CreateRecipeOtherIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_other_ingredients do |t|
      t.integer :other_ingredient_id
      t.integer :recipe_id
      t.integer :time_added_id
      t.integer :measurement_id
      t.integer :measurement_qty_id
      t.timestamps null: false
    end
  end
end
