class SessionsController < ApplicationController
  get '/login' do
    erb :'sessions/login.html'
  end

  post '/login' do
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/recipes'
    else
      erb :'sessions/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end