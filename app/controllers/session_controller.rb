class SessionsController < ApplicationController
  use Rack::Flash
  get '/index' do
    erb :'sessions/index.html'
  end
  
  get '/login' do
    @user = User.new
    erb :'sessions/login.html'
  end

  post '/login' do
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Log in successful"
      redirect '/recipes'
    else
      flash.now[:error] = "Username and Password do not match"
      erb :'sessions/login.html'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end