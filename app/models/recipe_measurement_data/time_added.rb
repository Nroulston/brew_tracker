class TimeAdded < ActiveRecord::Base
  has_many :recipe_other_ingredients
  has_many :recipe_yeasts 
  has_many :recipe_fermentables
  has_many :recipe_hops

  has_many :recipes, through: :other_ingredients
  has_many :recipes, through: :yeasts
  has_many :recipes, through: :fermentables
  has_many :recipes, through: :hops
end
