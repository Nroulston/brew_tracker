class RecipesController < ApplicationController

  get "/recipes" do
    erb :"/recipes/index.html"
  end

  get "/recipes/new" do
    erb :"/recipes/new.html"
  end

  post "/recipes" do
  #create a new recipe
  recipe = Recipe.new(params[:recipe])
  recipe.save
  
  # Todo If you figure out jquery creation of form inputs then you need to change below to an each do block to create find or create each ingredient.
 
  # Todo potentially use .send to make Hop.find_or_create_by dynamic for all ingredients def set_property(obj, prop_name, prop_value) obj.send("#{prop_name}=",prop_value) end potentially use hashes build out an attr accessor with hash of ingredients with classname, params accessors, join_tables, basically all things that might be variable per ingredient. This would allow you to make only one change to the ingredients hash to make changes to the entire process. 
  
  hop = Hop.find_or_create_by(name: params[:hop][0][:name], form: params[:hop][0][:form], alpha_acid: params[:hop][0][:alpha_acid])
  recipe.hops << hop 
  join_hop = RecipeHop.last
  add_time_measurement_and_measurement_quantity_to_join_table_record(join_hop, :hop)
  
  fermentable = Fermentable.find_or_create_by(name: params[:fermentable][0][:name])
  recipe.fermentables << fermentable
  join_fermentable = RecipeFermentable.last
  add_time_measurement_and_measurement_quantity_to_join_table_record(join_fermentable, :fermentable)
  
  yeast = Yeast.find_or_create_by(name: params[:yeast][0][:name])
  recipe.yeasts << yeast
  join_yeast = RecipeYeast.last
  add_time_measurement_and_measurement_quantity_to_join_table_record(join_yeast, :yeast)
  
  other_ingredient = OtherIngredient.find_or_create_by(name: params[:other_ingredient][0][:name])
  recipe.other_ingredients << other_ingredient
  join_other_ingredient = RecipeOtherIngredient.last
  add_time_measurement_and_measurement_quantity_to_join_table_record(join_other_ingredient, :other_ingredient)


  
  redirect "/recipes"
end

get "/recipes/:id" do
  set_recipe

  erb :"/recipes/show.html"
end

get "/recipes/:id/edit" do
  set_recipe
  
  erb :"/recipes/edit.html"
end

patch "/recipes/:id" do
  redirect "/recipes/:id"
end

delete "/recipes/:id/delete" do
  redirect "/recipes"
end

  helpers do

    def set_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end
    
    def add_time_measurement_and_measurement_quantity_to_join_table_record(join_table, ingredient)
      time, measurement, measurement_amount = make_or_find_time_measurement_measurement_amount_from_params(ingredient)
      join_table.time_added = time
      join_table.measurement = measurement
      join_table.measurement_amount = measurement_amount
      join_table.save
    end

    def make_or_find_time_measurement_measurement_amount_from_params(ingredient)
      time = TimeAdded.find_or_create_by(time_added: params[ingredient][0][:time_added])
      measurement = Measurement.find_or_create_by(measurement: params[ingredient][0][:measurement])
      measurement_amount = MeasurementAmount.find_or_create_by(measurement_amount: params[ingredient][0][:measurement_amount])
      return time,measurement,measurement_amount
    end
  end
end
