class ItemsController < ApplicationController

  def show
    @new_item = Item.new
    @item = Item.find(params[:id])
  end

  def new

  end

  def create
    json_item = GetSingleItemService.new(item: Item.new(google_api_id: params[:item][:google_api_id])).call
    @item = ParseItemService.new(item: json_item).call
    @item.list = current_user.list
    if @item.save
      redirect_to list_path(current_user.list)
    else
      flash[:alert] = "Item is already in your list"
      redirect_to new_list_item_path(current_user.list)
    end
  end

  def up
    @items = current_user.list.items
    @item = Item.find(params[:id])
    @item.move_higher
    respond_to do |format|
      format.html { redirect_to list_path(current_user) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def down
    @items = current_user.list.items
    @item = Item.find(params[:id])
    @item.move_lower
    respond_to do |format|
      format.html { redirect_to list_path(current_user) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to list_path(current_user)
      flash[:notice] = "Item succesfully destroyed"
    else
      redirect_to list_item_path(current_user, @item)
      flash[:danger] = "Something went wrong"
    end
  end
end
