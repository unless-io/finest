class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def show
    @items = get_items
  end

  def preview
    if params[:google_api_id].present?
    @new_item = Item.new
      @item = GetSingleItemService.new(item: Item.new(google_api_id: params[:google_api_id])).call
    else
      redirect_to root_path
    end
  end

  def search
    @results = GetListItemService.new(query: params[:query][:query]).call
    respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/lists/search.js.erb`
      end
  end

  private

  def get_items
    result = []
    @list.items.each do |item|
      result << GetSingleItemService.new(item: item).call
    end
    result
  end

  def set_list
    @list = current_user.list
  end

end
