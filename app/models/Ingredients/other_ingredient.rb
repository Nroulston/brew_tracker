class OtherIngredient < ActiveRecord::Base
  has_many :recipe_other_ingredients
  has_many :recipes, through: :recipe_other_ingredients
end
