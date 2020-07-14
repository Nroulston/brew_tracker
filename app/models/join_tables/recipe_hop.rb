class RecipeHop < ActiveRecord::Base
  belongs_to :hop
  belongs_to :recipe
  belongs_to :brewlog
  belongs_to :time_added
  belongs_to :measurement
  belongs_to :measurement_amount
end
