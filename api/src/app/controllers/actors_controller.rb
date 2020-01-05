# frozen_string_literal: true

class ActorsController < ApplicationController
  def index
    scope = Actor
              .includes(:actor_images).includes(:brothel)
              .where(is_delete: 0, is_exist_diary: 1)

    #  TODO: Formクラスに処理を移管する
    if params[:prefs].present?
      scope = scope.where(brothels: { prefecture_id: params[:prefs] })
    end
    if params[:types].present?
      scope = scope.where(brothels: { brothel_type_id: params[:types] })
    end
    scope = scope
              .order(updated_at: :desc)
              .page(params[:page] ||= 1)

    actors = scope

    print params[:types]
    print params[:prefs]
    # join先のテーブルのattributeを戻り値に付与する
    options = {}
    options = setOptions(options)
    # TODO: ページネーション用URLに変更する
    options[:links] = {
      self: "...",
      next: "...",
      prev: "..."
    }
    render_json(ActorSerializer, actors, options)
  end

  def show
    @actor = Actor.find(params[:id])

    options = {}
    options[:include] = [:actor_images, :brothel]

    render_json(ActorSerializer, @actor, options)
  end

  private
    def setOptions(options)
      options[:include] = [:actor_images, :brothel]
      options
    end

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
