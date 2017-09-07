class ListsController < ApplicationController
  before_action :set_list, only: [:show, :preview]

  def show
    @items = current_user.list.items
  end

  def preview
    if params[:google_api_id].present?
      @new_item = Item.new
      json_item = GetSingleItemService.new(item: Item.new(google_api_id: params[:google_api_id])).call
      @item = ParseItemService.new(item: json_item).call
    else
      redirect_to root_path
    end
  end

  def search
    @new_item = Item.new
    @json_results = GetListItemService.new(query: params[:query][:query]).call
    @results = ParseItemService.new(items: @json_results["items"]).call
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
         # <-- will render `app/views/lists/search.js.erb`
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
