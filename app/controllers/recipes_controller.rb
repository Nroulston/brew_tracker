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
  recipe.hops.find_or_create_by(name: params[:hop][0][:name], form: params[:hop][0][:form], alpha_acid: params[:hop][0][:alpha_acid])
    join_hop = RecipeHop.last
  # #associate or create time_added, measurement_amount
   time = TimeAdded.find_or_create_by(time_added: params[:hop][0][:time_added])
  #  measurement = Measurement.find_or_create_by(name: params[:hop][0][:measurement])

    binding.pry
    redirect "/recipes"
  end

  get "/recipes/:id" do
    erb :"/recipes/show.html"
  end

  get "/recipes/:id/edit" do


    erb :"/recipes/edit.html"
  end

  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

  delete "/recipes/:id/delete" do
    redirect "/recipes"
  end
end
