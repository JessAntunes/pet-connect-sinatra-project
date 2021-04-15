class ShelterController < ApplicationController

    get '/shelter' do
        @shelter = Shelter.all
        erb :'shelter/index'
    end 
    
    get "/signup" do
        erb :'shelter/signup'
    end
    
    post "/signup" do
        if params[:email].empty? || params[:password].empty? || params[:shelter_name].empty? || params[:location].empty?
            flash[:notice] = "Please be sure to complete all fields."
            redirect "/signup"
        else 
            shelter = Shelter.create(params)
            redirect "/shelter"
        end
    end
    
    get '/shelter/:id' do 
        @shelter = Shelter.find(params[:id])
        erb :'shelter/show'
    end 
    
    get '/shelter/:id/edit' do
        @shelter = Shelter.find(params[:id]) 
        if logged_in? && @shelter == current_shelter
            erb :'shelter/edit'
        else
            redirect '/login'
        end
    end 
    
    patch '/shelter/:id' do 
        shelter = Shelter.find(params[:id])
        params.delete("_method")
        shelter.update(params)
        redirect to "/shelter/#{shelter.id}"
    end

    get '/shelter/:id/animals' do
        @shelter = Shelter.find(params[:id])
        erb :'shelter/our_animals'
    end
    
    delete '/shelter/:id' do 
        @shelter = Shelter.find(params[:id])
        @shelter.animals.destroy_all
        @shelter.delete
        redirect to '/shelter'
    end


end