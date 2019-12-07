class Brothel < ApplicationRecord
  has_many :actors

  validates :brothel_name, uniqueness: { scope: :prefecture }
end
