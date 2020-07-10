class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :method
      t.string :boil_time
      t.string :batch_size
      t.string :pre_boil_size
      t.string :pre_boil_gravity
      t.string :target_fg
      t.string :target_og
      t.string :ibu
      t.string :srm
      t.string :mash_ph
      t.string :mash_schedule

      t.timestamps null: false
    end
  end
end
