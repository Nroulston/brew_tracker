class BrewLogsController < ApplicationController

  # GET: /brew_logs
  get "/brew_logs" do
    erb :"/brew_logs/index.html"
  end

  
  get "/brew_logs/new" do
    erb :"/brew_logs/new.html"
  end

  
  post "/brew_logs" do
    redirect "/brew_logs"
  end

  
  get "/brew_logs/:id" do
    erb :"/brew_logs/show.html"
  end

  
  get "/brew_logs/:id/edit" do
    erb :"/brew_logs/edit.html"
  end

  
  patch "/brew_logs/:id" do
    redirect "/brew_logs/:id"
  end

  
  delete "/brew_logs/:id/delete" do
    redirect "/brew_logs"
  end
end
