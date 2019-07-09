class GenresController < ApplicationController
  def index
    genre = Genre.all
    render json: genre.to_json(:include => {
      :subgenres => {:only => [:id, :category]}
      })
  end
end
