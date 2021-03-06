# frozen_string_literal: true

require "jwt"

class ApplicationController < ActionController::API
  # 200 Success
  def response_success(class_name, action_name)
    render status: 200, json: { status: 200, message: "Success #{class_name.capitalize} #{action_name.capitalize}" }
  end

  # 400 Bad Request
  def response_bad_request
    render status: 400, json: { status: 400, message: "Bad Request" }
  end

  # 401 Unauthorized
  def response_unauthorized
    render status: 401, json: { status: 401, message: "Unauthorized" }
  end

  # 404 Not Found
  def response_not_found(class_name = "page")
    render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
  end

  # 409 Conflict
  def response_conflict(class_name)
    render status: 409, json: { status: 409, message: "#{class_name.capitalize} Conflict" }
  end

  # 500 Internal Server Error
  def response_internal_server_error
    render status: 500, json: { status: 500, message: "Internal Server Error" }
  end

  def not_found
    render json: { error: "not_found" }
  end

  def authorize_request
    region = ENV["REGION"]
    userPoolId = ENV["USER_POOL_ID"]
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin
      # JWT 形式からトークン文字列をデコード
      decode = JWT.decode header, nil, false

      # JWT トークンヘッダーから kid を取得
      kid = decode[1]["kid"]

      # iss クレームを確認
      return render json: { error: "invalid auth" } if decode[0]["iss"] != "https://cognito-idp.#{region}.amazonaws.com/#{userPoolId}"

      # token_use クレームを確認
      return render json: { error: "invalid auth" } if decode[0]["token_use"] != "id"

      # ユーザープールの JSON Web トークン (JWT) セットをダウンロードして保存
      jwk = JsonWebToken.getJwk(kid)
      return render json: { error: "user not_found" } if jwk.empty?

      # Cognitoから取得したjwkとフロントから受け取るユーザ情報を比較する
      JsonWebToken.fetch(jwk, header)

    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  private
    def render_json(serializer, obj, options = {})
      if obj.class.name == "ActiveRecord::Relation"
        return render_collection(serializer, obj, options)
      end

      render_record(serializer, obj, options)
    end

    def render_collection(serializer, collection, options = {})
      options = meta_pagination(collection, options)
      render_record(serializer, collection, options)
    end

    def render_record(serializer, record, options = {})
      render json: serializer.new(record, options)
    end

    # ページネーションに関するmetaデータを追加する
    def meta_pagination(paginated_obj, options = {})
      options[:meta] = {} unless options.has_key?(:meta)
      meta_options = options[:meta].merge(generate_pagination(paginated_obj))
      options[:meta] = meta_options
      options
    end

    # metaデータとして付与する項目の定義

    def generate_pagination(paginated_obj)
      {
        pagination: {
          current_page: paginated_obj.current_page,
          prev_page: paginated_obj.prev_page,
          next_page: paginated_obj.next_page,
          total_pages: paginated_obj.total_pages
        }
      }
    end
end
