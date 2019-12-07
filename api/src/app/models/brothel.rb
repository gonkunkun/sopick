class Brothel < ApplicationRecord
  has_many :actors

  # HACK: brothel_idをユニークキーから外す
  validates :brothel_id, uniqueness: { scope: [:brothel_name, :prefecture] }
end
