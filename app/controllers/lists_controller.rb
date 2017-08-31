class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def show
    @items = get_items
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
