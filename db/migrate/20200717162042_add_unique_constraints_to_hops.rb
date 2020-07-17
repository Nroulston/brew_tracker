class AddUniqueConstraintsToHops < ActiveRecord::Migration[5.2]
  def change
    add_index :hops, [:name, :form, :alpha_acid], unique: true
  end
end
