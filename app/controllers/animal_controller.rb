class AnimalController < ApplicationController

    get '/animals' do
        @animals = Animal.all
        erb :index
    end 
    
    get '/animals/new' do 
        erb :new
    end
    
    post '/animals' do 
        @animal = Animal.create(params)
        redirect "/animals/#{@animal.id}"
    end
    
    get '/animals/:id' do 
        @animal = Animal.find_by_id(params[:id])
        erb :show
    end 
    
    get '/animals/:id/edit' do 
        @animal = Animal.find_by_id(params[:id])
        erb :edit
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