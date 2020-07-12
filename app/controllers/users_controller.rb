class UsersController < ApplicationController

 
  get "/users/signup" do
    erb :"/users/new.html"
  end

  post "/users" do
    
    @user = User.new(params[:user])
    if @user.save
      binding.pry
      session[:user_id] = @user.id
      #Todo create profile and ability to edit. Possibly use a seperate controller and views.
      redirect '/recipes'
    else
      erb :'users/new.html'
    end
  end


  #Todo delete the rest if you make a seperate controller for profilfe. Keeping for now 
  get "/users/:id" do
    erb :"/users/show.html"
  end

  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  
  patch "/users/:id" do
    redirect "/users/:id"
  end

  
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
