# frozen_string_literal: true

class ActorImageSerializer < ActiveModel::Serializer
  attributes :id,
             :image_path
  :updated_at
  # has_one :actor
end
