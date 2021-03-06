require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET_KEY']
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    shelter = Shelter.find_by(email: params[:email])
    if shelter && shelter.authenticate(params[:password])
      session[:shelter_id] = shelter.id
      redirect "/shelter"
    else
      flash[:notice] = "Email/Password is invalid. Please try again."
      redirect "/login"
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:shelter_id]
    end

    def current_shelter
      Shelter.find(session[:shelter_id])
    end
  end

end
