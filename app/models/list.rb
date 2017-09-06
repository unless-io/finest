class List < ApplicationRecord
  belongs_to :user
  has_many :items, -> {order(position: :asc)}
end
