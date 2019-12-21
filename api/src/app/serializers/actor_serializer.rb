class ActorSerializer < ActiveModel::Serializer
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
  # has_one :brothel
  has_many :actor_images
end
