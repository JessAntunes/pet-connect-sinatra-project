class ShelterController < ApplicationController

    get '/shelters' do
        @shelters = Shelter.all
        erb :"shelter/index"
    end 
    
    get "/signup" do
        erb :"shelter/signup"
    end
    
    post "/signup" do
        if params[:email].empty? || params[:password].empty? || params[:shelter_name].empty? || params[:location].empty?
            redirect "/failure"
        else 
            shelter = Shelter.create(params)
            redirect "/shelters"
        end
    end
    
    get '/shelters/:id' do 
        @shelter = Shelter.find_by_id(params[:id])
        erb :'shelter/show'
    end 
    
    get '/shelters/:id/edit' do 
        @shelter = Shelter.find_by_id(params[:id])
        erb :'shelter/edit'
    end 
    
    patch '/shelters/:id' do 
        @shelter = Shelter.find_by_id(params[:id])
        @shelter.update(params)
        redirect to "/shelters/#{@shelter.id}"
    end
    
    delete '/shelters/:id' do 
        @shelter = Shelter.find_by_id(params[:id])
        @shelter.delete
        redirect to '/shelters'
    end


end