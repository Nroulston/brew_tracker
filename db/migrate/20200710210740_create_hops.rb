class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.string :name
      t.string :type
      t.string :alpha_acid
  

      t.timestamps null: false
    end
  end
end
