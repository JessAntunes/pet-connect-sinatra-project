class AnimalController < ApplicationController

    get '/animals' do
        @animals = Animal.all
        erb :"animal/index"
    end 
    
    get '/animals/new' do 
        erb :"animal/new"
    end
    
    post '/animals' do 
        @animal = Animal.create(params)
        redirect "/animals/#{@animal.id}"
    end
    
    get '/animals/:id' do 
        @current_shelter = current_shelter
        @animal = Animal.find_by_id(params[:id])
        erb :'animal/show'
    end 
    
    get '/animals/:id/edit' do 
        @animal = Animal.find_by_id(params[:id])
        erb :'animal/edit'
    end 
    
    patch '/animals/:id' do 
        @animal = Animal.find_by_id(params[:id])
        @animal.update(params)
        redirect to "/animals/#{@animal.id}"
    end
    
    delete '/animals/:id' do 
        @animal = Animal.find_by_id(params[:id])
        @animal.delete
        redirect to '/animals'
    end


end