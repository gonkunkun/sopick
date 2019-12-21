# frozen_string_literal: true

class Actor < ApplicationRecord
  belongs_to :brothel
  has_many :actor_images

  validates :name, uniqueness: { scope: [:brothel_id] }
end
