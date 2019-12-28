# frozen_string_literal: true

class ActorsController < ApplicationController
  PER = 24

  def index
    # TODO: ページング処理追加
    @actors = Actor.includes(:actor_images).where(is_delete: 0, is_exist_diary: 1).order(id: :desc).page(params[:page] ||= 1)
    
    options = {}
    options[:include] = [:actor_images, :brothel]
    json_string = ActorSerializer.new(@actors, options).serialized_json

    render json: json_string
  end

  def show
    @actor = Actor.find(params[:id])
    render json: @actor
  end
end
