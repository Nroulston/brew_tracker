class CreateOtherIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :other_ingredients do |t|
      t.string :name
      

      t.timestamps null: false
    end
  end
end
