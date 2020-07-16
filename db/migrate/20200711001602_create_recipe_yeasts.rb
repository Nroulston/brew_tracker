class CreateRecipeYeasts < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_yeasts do |t|
      t.integer :yeast_id
      t.integer :recipe_id
      t.integer :brew_log_id
      t.integer :time_added_id
      t.integer :measurement_id
      t.integer :measurement_amount_id

      t.timestamps null: false
    end
  end
end
