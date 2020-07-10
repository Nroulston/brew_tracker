class CreateYeasts < ActiveRecord::Migration[4.2]
  def change
    create_table :yeasts do |t|
      t.string :name
      t.integer :recipe_id
      t.integer :brewlog_id

      t.timestamps null: false
    end
  end
end
