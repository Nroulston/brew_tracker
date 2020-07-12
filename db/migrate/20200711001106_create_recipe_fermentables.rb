class CreateRecipeFermentables < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_fermentables do |t|
      t.integer :fermentable_id
      t.integer :recipe_id
      t.integer :brew_log_id
      t.integer :time_added_id
      t.integer :measurement_id
      t.integer :measurement_qty_id

      t.timestamps null: false
    end
  end
end
