class AddUniqueConstraintsToHops < ActiveRecord::Migration
  def change
    add_index :hops, [:name, :form, :alpha_acid], unique: true
  end
end
