class Fermentable < ActiveRecord::Base
  has_many :recipe_fermentables
  has_many :recipes, through: :recipe_fermentables
end
