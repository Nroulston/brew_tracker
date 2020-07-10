class BrewLog < ActiveRecord::Base
  has_many :hops
  has_many :fermentables
  has_many :yeasts
  has_many :other_inredients
  belongs_to :user
  belongs_to :recipe
end
