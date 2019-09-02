class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: @birds

    ##since we have an array of hashes, we have to use only:
    #only: helps us to chose what parts of our array we want. and which parts of our array are crap

    # render json: birds, only: [:id, :name, :species]

    # we could also use except: to exclude data
    render json: birds, execpt:[:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # #this method uses hashes to render JSON

    # render json: {id: bird.id, name: bird.name, species: bird.species }

    #this method uses slice
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  
  end
end