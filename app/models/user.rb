class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :recipes
  has_many :brew_logs
end
