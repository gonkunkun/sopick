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
    # TODO: ページネーション用URLに変更する
    options[:links] = {
      self: '...',
      next: '...',
      prev: '...'
    }
    render_json(ActorSerializer, actors, options)
  end

  def show
    actor = Actor.find(params[:id])
    render json: actor
  end

  private

  # ページネーションに関するlinkを追加する
  # def links_pagination(paginated_obj, options={})
  #   options[:links] = {} unless options.has_key?(:links)
  #   links_options = options[:links].merge(generate_pagination_links(paginated_obj))
  #   options[:links] = links_options
  #   options
  # end

  # metaデータとして付与する項目の定義
  # def generate_pagination_links(paginated_obj)
  #   {
  #     pagination: {
  #       self: "#{paginated_obj.current_page}",
  #       prev: "#{paginated_obj.prev_page}",
  #       next: "#{paginated_obj.next_page}",
  #       last: "#{paginated_obj.total_pages}"
  #     }
  #   }
  # end

end