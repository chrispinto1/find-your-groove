class SubgenresController < ApplicationController
  def index
    subgenres = Subgenre.all
    render json: subgenres.to_json(:include => {
      :bands => {:only => [:id, :name]}
      })
  end

  def show
    subgenre = Subgenre.find(params[:id])
    render json: subgenre.to_json(:include => {
      :bands => {:only => [:id, :name]}
      })
  end
end
