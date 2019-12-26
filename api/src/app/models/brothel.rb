# frozen_string_literal: true

class Brothel < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :actors
  belongs_to_active_hash  :prefecture
  belongs_to_active_hash  :brothel_type

  validates :brothel_name, uniqueness: { scope: :prefecture_id }
end
