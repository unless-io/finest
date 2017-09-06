class AddPositionToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :position, :integer
  end
end
