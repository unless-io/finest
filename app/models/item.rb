class Item < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list, add_new_at: :top
  has_one :comment, dependent: :destroy
  validates :google_api_id, uniqueness: { scope: :list, message: "item is already in your list"}
end
