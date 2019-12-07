class Actor < ApplicationRecord
  belongs_to :brothel
  has_many :actor_images

  # HACK: actor_idをユニークキーから外す
  validates :actor_id, uniqueness: { scope: [:name, :brothel_id] }
end
