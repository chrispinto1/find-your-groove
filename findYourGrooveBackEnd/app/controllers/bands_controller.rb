class BandsController < ApplicationController

  def index
    bands = Band.all
    render json: bands.to_json(:include => {
      :subgenres => {:only => [:id, :category]},
      :songs => {:only => [:id, :title]}
      })
  end
end
