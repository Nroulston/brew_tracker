class RecipesController < ApplicationController

  get "/recipes" do
    erb :"/recipes/index.html"
  end

  get "/recipes/new" do
    erb :"/recipes/new.html"
  end

  post "/recipes" do
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
