class Actor < ApplicationRecord
  belongs_to :brothel
  has_many :actor_images

  # HACK: actor_idをユニークキーから外す
  validates :name, uniqueness: { scope: [:brothel_id] }
end
