# frozen_string_literal: true

class BrothelSerializer < ActiveModel::Serializer
  attributes :id,
             :brothel_name,
             :brothel_name_en,
             :brothel_url,
             :prefecture_id,
             :prefecture,
             :area,
             :area_en,
             :area_id,
             :area_detail_id,
             :brothel_type_id,
             :brothel_type_name
  has_many   :actors

end
