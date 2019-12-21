class ActorsController < ApplicationController
  def index
    # TODO: ページング処理追加
    @actors = Actor.where(is_delete: 0, is_exist_diary: true).order(id: :desc).limit(50)
    render json: @actors
  end

  def show
    @actor = Actor.find(params[:id])
    render json: @actor
  end
end
