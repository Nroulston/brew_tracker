class StyleColumnAddedToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :style, :string

  end
end
