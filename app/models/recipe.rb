class Recipe < ActiveRecord::Base
  has_many :hops
  has_many :fermentables
  has_many :yeasts
  has_many :other_ingredients
  has_many :brew_logs
  
  belongs_to :user
end
