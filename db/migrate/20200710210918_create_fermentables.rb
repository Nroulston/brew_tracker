class CreateFermentables < ActiveRecord::Migration
  def change
    create_table :fermentables do |t|
      t.string :name
      

      t.timestamps null: false
    end
  end
end
