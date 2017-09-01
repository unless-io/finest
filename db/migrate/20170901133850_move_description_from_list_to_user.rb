class MoveDescriptionFromListToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :string, default: "Hello world, this is your list. You get only one so treat it with care. Good luck!🚀"
    remove_column :lists, :description, :string
  end
end
