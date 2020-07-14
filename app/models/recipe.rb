class Recipe < ActiveRecord::Base
  has_many :recipe_other_ingredients
  has_many :recipe_yeasts 
  has_many :recipe_fermentables
  has_many :recipe_hops

  has_many :hops, through: :recipe_hops
  has_many :time_addeds, through: :recipe_hops
  has_many :measurements, through: :recipe_hops
  has_many :measurement_qtys, through: :recipe_hops

  has_many :other_ingredients, through: :recipe_other_ingredients
  has_many :yeasts, through: :recipe_yeasts
  has_many :fermentables, through: :recipe_fermentables
  

  has_many :brew_logs
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end

#Todo need to use the following sql or something similar to add each foreign key into the Recipe_hop join table 
# sql = <<-SQL
# INSERT INTO recipe_hops (recipe_id, time_added_id, hop_id, created_at, updated_at) VALUES (3, 1, 1,datetime('now'),datetime('now'))
# SQL

# INSERT INTO datetime_text (d1, d2)
# VALUES(datetime('now'),datetime('now', 'localtime'));
# ActiveRecord::Base.connection.execute(sql)

# class DeleteCreateAtAndUpdatedAtColumnFromRecipeHopsTable < ActiveRecord::Migration[5.2]
#   def change

#     remove_column :recipe_hops, :created_at
#     remove_column :recipe_hops, :updated_at
#   end
# end
