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
  #associate or create a hop takes on hop and make it. If you figure out jquery creation of form inputs then you need to change below to an each do block to create find or create each hop.
  
  hop = Hop.find_or_create_by(name: params[:hop][0][:name], form: params[:hop][0][:form], alpha_acid: params[:hop][0][:alpha_acid])
  recipe.hops << hop  
  join_hop = RecipeHop.last
  
  time = TimeAdded.find_or_create_by(time_added: params[:hop][0][:time_added])
  join_hop.time_added = time

  measurement = Measurement.find_or_create_by(measurement: params[:hop][0][:measurement])
  join_hop.measurement = measurement

  measurement_amount = MeasurementAmount.find_or_create_by(measurement_amount: params[:hop][0][:measurement_amount])
  join_hop.measurement_amount = measurement_amount
  
  join_hop.time_added
    binding.pry
    redirect "/recipes"
  end

  get "/recipes/:id" do
    erb :"/recipes/show.html"
  end

  get "/recipes/:id/edit" do

    #Use the below to access a recipes hops join table and also the associated attribute objects. 
    #use recipe = whatever you need to find the current recipe
    #recipe.recipe_hops.first.time_added 

    erb :"/recipes/edit.html"
  end

  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

  delete "/recipes/:id/delete" do
    redirect "/recipes"
  end
end
