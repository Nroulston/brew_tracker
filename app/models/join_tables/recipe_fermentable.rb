class RecipeFermentable < ActiveRecord::Base
  belongs_to :fermentable
  belongs_to :recipe
  belongs_to :brewlog
  belongs_to :time_added
  belongs_to :measurement
  belongs_to :measurement_amount
end
