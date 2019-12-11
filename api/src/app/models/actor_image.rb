class ActorImage < ApplicationRecord
  belongs_to :actor
  validates :id, uniqueness: { scope: [:image_path] }
end