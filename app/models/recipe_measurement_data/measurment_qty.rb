class MeasurmentQty < ActiveRecord::Base
  has_many :recipe_other_ingredients
  has_many :recipe_yeasts 
  has_many :recipe_fermentables
  has_many :recipe_hops

  has_many :recipes, through: :recipe_other_ingredients
  has_many :recipes, through: :recipe_yeasts
  has_many :recipes, through: :recipe_fermentables
  has_many :recipes, through: :recipe_hops

  has_many :brew_logs, through: :recipe_other_ingredients
  has_many :brew_logs, through: :recipe_yeasts
  has_many :brew_logs, through: :recipe_fermentables
  has_many :brew_logs, through: :recipe_hops
end
