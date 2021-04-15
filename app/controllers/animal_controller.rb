class AnimalController < ApplicationController

    get '/animal' do
        erb :"animal/index"
    end 
    
    get '/animal/new' do 
        if logged_in?
            erb :"animal/new"
        else
            redirect '/login' 
        end
    end
    
    post '/animal' do 
        animal = Animal.create(params)
        animal.shelter_id = current_shelter.id
        redirect "/animal/#{animal.id}"
    end
    
    get '/animal/:id' do 
        @current_shelter = current_shelter
        @animal = Animal.find(params[:id])
        @shelter = Shelter.find(@animal.shelter_id)
        erb :'animal/show'
    end 
    
    get '/animal/:id/edit' do 
        @animal = Animal.find(params[:id])
        if logged_in? && @animal.shelter_id == current_shelter.id
            erb :'animal/edit'
        else
            redirect '/login'
        end
    end 
    
    patch '/animal/:id' do 
        animal = Animal.find(params[:id])
        params.delete("_method")
        animal.update(params)
        redirect to "/animal/#{animal.id}"
    end
    
    delete '/animal/:id' do 
        animal = Animal.find(params[:id])
        animal.delete
        redirect to '/animal'
    end


end