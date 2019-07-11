class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    render json: users.to_json(:include => {
      :bands => {:only => [:id, :name]}
      })
  end

  def create
    user = User.create(name: params[:name])
    render json: user
  end

end
