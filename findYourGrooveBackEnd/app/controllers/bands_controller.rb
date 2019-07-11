class BandsController < ApplicationController

  def index
    bands = Band.all
    render json: bands.to_json(:include => {
      :subgenres => {:only => [:id, :category]},
      :songs => {:only => [:id, :title]}
      })
  end

  def show
    band = Band.find(params[:id])
    render json: band.to_json(:include => {
      :songs => {:only => [:id, :title, :spoitfy_snippet]}
      })
  end
end
