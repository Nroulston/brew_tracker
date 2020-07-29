class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
 
  
  has_many :recipes
  has_many :brew_logs

  has_many :recipe_copies , through: :brew_logs, source: :recipe

end
