require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "cadd9543f0bd89b65b09123f9e959cff60e13284545a38b8f7d8c32acb4ad5fd42505efc0799c1bd929039d074eefbef1fcbc24506954fc50e8376f39f27e747"
  end
  
  
  get "/" do
   
    erb :welcome
  end

  helpers do 
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def set_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end
    
    def set_brew_log
      @brew_log= BrewLog.find_by_id(params[:id])
    end
  end
end
