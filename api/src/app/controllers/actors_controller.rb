class ActorsController < ApplicationController
  def index
    @actors = Actor.where(is_delete: 0, is_exist_diary: true).order(id: :desc).limit(50)
    render json: @actors
  end

  def show
    @actor = Actor.find(params[:id])
    render json: @actor
  end
end
