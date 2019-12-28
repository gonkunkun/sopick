# frozen_string_literal: true

class ActorsController < ApplicationController
  def index
    actors = Actor
              .includes(:actor_images).includes(:brothel)
              .where(is_delete: 0, is_exist_diary: 1)
              .order(created_at: :asc)
              .page(params[:page] ||= 1)
    
    # join先のテーブルのattributeを戻り値に付与する
    options = {}
    options[:include] = [:actor_images, :brothel]

    render_json(ActorSerializer, actors, options)
  end

  def show
    actor = Actor.find(params[:id])
    render json: actor
  end
end
