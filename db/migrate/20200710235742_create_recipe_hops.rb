class CreateRecipeHops < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_hops do |t|
      t.integer :hop_id
      t.integer :recipe_id
      t.integer :time_added_id
      t.integer :measurement_id
      t.integer :measurement_qty_id

      t.timestamps null: false
    end
  end
end
