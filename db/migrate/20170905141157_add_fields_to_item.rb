class AddFieldsToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :content, :text
    add_column :items, :author, :string
    add_column :items, :publishing_date, :string
    add_column :items, :thumbnail, :string
  end
end
