class ActorImage < ApplicationRecord
  belongs_to :actor
  # HACK: image_idをユニークキーから外す
  validates :id, uniqueness: { scope: [:image_url, :image_path] }
end