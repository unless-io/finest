class ItemsController < ApplicationController

  def show
    @json_item = GetSingleItemService.new(item: Item.find(params[:id])).call["volumeInfo"]
  end

  def new 
  end
end
