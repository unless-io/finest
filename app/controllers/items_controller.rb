class ItemsController < ApplicationController

  def show
    @json_item = GetSingleItemService.new(item: Item.find(params[:id])).call["volumeInfo"]
  end

  def new
    # TODO HIER KAN DE SEARCH KOMEN IN PLAATS VAN OP DE HOME
    # @item = GetSingleItemService.new(item: Item.new(google_api_id: params[:google_api_id])).call["volumeInfo"]
  end

  def create
    @item = Item.new(item_params)
    @item.list = current_user.list
    if @item.save
      redirect_to list_path(current_user)
    else
      render 'new'
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

  private

  def item_params
    params.require(:item).permit(:title, :google_api_id)
  end
end
