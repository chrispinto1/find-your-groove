class SubgenresController < ApplicationController
  def index
    subgenre = Subgenre.all
    render json: subgenre.to_json(:include => {
      :bands => {:only => [:id, :name]}
      })
  end
end
