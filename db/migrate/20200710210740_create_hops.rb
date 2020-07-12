class CreateHops < ActiveRecord::Migration[4.2]
  def change
    create_table :hops do |t|
      t.string :name
      t.string :type
      t.string :alpha_acid
  

      t.timestamps null: false
    end
  end
end
