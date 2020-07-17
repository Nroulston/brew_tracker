class Yeast < ActiveRecord::Base
  validates :name, uniqueness: true
  
  has_many :recipe_yeasts

  has_many :measurements, through: :recipe_yeasts
  has_many :time_addeds, through: :recipe_yeasts
  has_many :measurement_amounts, through: :recipe_yeasts

  has_many :recipes, through: :recipe_yeasts
  has_many :brew_logs, through: :recipe_yeasts
end
