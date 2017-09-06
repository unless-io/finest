class Item < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list, add_new_at: :top
  has_one :comment, dependent: :destroy
end
