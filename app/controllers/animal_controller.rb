class AnimalController < ApplicationController

    get '/animal' do
        @current_shelter = current_shelter
        
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
        @animal = Animal.create(params)
        redirect "/animal/#{@animal.id}"
    end
    
    get '/animal/:id' do 
        @current_shelter = current_shelter
        @animal = Animal.find(params[:id])
        @shelter = Shelter.find(@animal.shelter_id)
        erb :'animal/show'
    end 
    
    get '/animal/:id/edit' do 
        if logged_in?
            @animal = Animal.find(params[:id])
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