class Hop < ActiveRecord::Base
  
  
has_many :recipe_hops

has_many :measurements, through: :recipe_hops
  has_many :time_addeds, through: :recipe_hops
  has_many :measurement_amounts, through: :recipe_hops

has_many :recipes, through: :recipe_hops
has_many :brew_logs, through: :recipe_hops
end
