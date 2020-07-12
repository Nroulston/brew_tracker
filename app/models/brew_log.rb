class BrewLog < ActiveRecord::Base
  

  
  belongs_to :user
  belongs_to :recipe

  validates :name, presence: true, uniqueness: true

  #Todo
end