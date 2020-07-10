class CreateOtherIngredients < ActiveRecord::Migration
  def change
    create_table :other_ingredients do |t|
      t.string :name
      t.integer :recipe_id
      t.integer :brewlog_id

      t.timestamps null: false
    end
  end
end
