class Item < ApplicationRecord
  belongs_to :list
  has_one :comment, dependent: :destroy
end
