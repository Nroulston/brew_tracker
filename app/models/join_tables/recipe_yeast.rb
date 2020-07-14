class RecipeYeast < ActiveRecord::Base
  belongs_to :yeast
  belongs_to :recipe
  belongs_to :brewlog
  belongs_to :time_added
  belongs_to :measurement
  belongs_to :measurement_amount
end
