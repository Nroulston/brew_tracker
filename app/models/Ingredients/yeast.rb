class Yeast < ActiveRecord::Base
  has_many :recipe_yeasts
  has_many :recipes, through: :recipe_yeasts
  has_many :brew_logs, through: :recipe_yeasts
end
