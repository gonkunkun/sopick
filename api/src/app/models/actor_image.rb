class ActorImage < ApplicationRecord
  belongs_to :actor
  # HACK: image_idをユニークキーから外す
  validates :image_id, uniqueness: { scope: [:image_url, :image_path] }
end