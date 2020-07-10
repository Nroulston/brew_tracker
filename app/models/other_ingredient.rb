class OtherIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :brew_log
end
