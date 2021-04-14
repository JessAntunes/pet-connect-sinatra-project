require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bojackjack_horseman_is_actually_a_horse"
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :"session/signup"
  end

  post "/signup" do
    user = User.new(username: params[:username], password: params[:password])
    if user.username == ""
      redirect "/failure"
    elsif user.save
      redirect "/login"
    else
      redirect "/failure"
    end

  end

  get '/account' do
    @user = current_user
    erb :account
  end


  get "/login" do
    erb :"session/login"
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/login"
    else
      redirect "/signup"
    end
  end

  get "/failure" do
    erb :"session/failure"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
