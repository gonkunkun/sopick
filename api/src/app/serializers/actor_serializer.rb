# frozen_string_literal: true

class ActorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :brothel_id,
             :girl_id,
             :name,
             :age,
             :tall,
             :bust,
             :cup,
             :waist,
             :hip,
             :actor_page_url
  has_one  :brothel, links: {
    related: -> (object) {
      # TODO: 正しいエンドポイントへ変更
      "https://movies.com/#{object.id}/actors"
    }
  }
  has_many :actor_images, links: {
    related: -> (object) {
      # TODO: 正しいエンドポイントへ変更
      "https://movies.com/#{object.id}/actors"
    }
  }
end
