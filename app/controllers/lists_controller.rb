class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def show
    @items = get_items
  end

  def preview
    if params[:google_api_id].present?
      @item = GetSingleItemService.new(item: Item.new(google_api_id: params[:google_api_id])).call["volumeInfo"]
    else
      redirect_to root_path
    end
  end

  private

  def get_items
    result = []
    @list.items.each do |item|
      result << GetSingleItemService.new(item: item).call["volumeInfo"]
    end
    result
  end

  def set_list
    @list = current_user.list
  end

end
