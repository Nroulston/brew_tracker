class UsersController < ApplicationController

 
  get "/users/signup" do
    erb :"/users/new.html"
  end

  post "/users" do
    
    @user = User.new(params[:user])
    if @user.save
      binding.pry
      session[:user_id] = @user.id
      redirect '/recipes'
    else
      erb :'users/new.html'
    end
  end

 
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
