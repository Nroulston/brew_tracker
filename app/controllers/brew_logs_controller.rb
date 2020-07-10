class BrewLogsController < ApplicationController

  # GET: /brew_logs
  get "/brew_logs" do
    erb :"/brew_logs/index.html"
  end

  # GET: /brew_logs/new
  get "/brew_logs/new" do
    erb :"/brew_logs/new.html"
  end

  # POST: /brew_logs
  post "/brew_logs" do
    redirect "/brew_logs"
  end

  # GET: /brew_logs/5
  get "/brew_logs/:id" do
    erb :"/brew_logs/show.html"
  end

  # GET: /brew_logs/5/edit
  get "/brew_logs/:id/edit" do
    erb :"/brew_logs/edit.html"
  end

  # PATCH: /brew_logs/5
  patch "/brew_logs/:id" do
    redirect "/brew_logs/:id"
  end

  # DELETE: /brew_logs/5/delete
  delete "/brew_logs/:id/delete" do
    redirect "/brew_logs"
  end
end
