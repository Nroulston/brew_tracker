class RecipeOtherIngredient < ActiveRecord::Base
  belongs_to :other_ingredient
  belongs_to :recipe
  belongs_to :time_added
  belongs_to :measurement
  belongs_to :measurement_qty

end
