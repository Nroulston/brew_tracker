class OtherIngredient < ActiveRecord::Base
  has_many :recipe_other_ingredients

  has_many :measurements, through: :recipe_other_ingredients
  has_many :time_addeds, through: :recipe_other_ingredients
  has_many :measurement_amounts, through: :recipe_other_ingredients

  has_many :recipes, through: :recipe_other_ingredients
  has_many :brew_logs, through: :recipe_other_ingredients
end
