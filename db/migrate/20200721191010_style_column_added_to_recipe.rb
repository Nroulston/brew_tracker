class StyleColumnAddedToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :style, :string

  end
end
