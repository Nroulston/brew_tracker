class CreateFermentables < ActiveRecord::Migration[4.2]
  def change
    create_table :fermentables do |t|
      t.string :name
      t.integer :recipe_id
      t.integer :brewlog_id

      t.timestamps null: false
    end
  end
end
