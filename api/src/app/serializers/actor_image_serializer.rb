# frozen_string_literal: true

class ActorImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :image_path,
             :updated_at
  # has_one :actor
end
