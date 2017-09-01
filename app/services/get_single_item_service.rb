require 'open-uri'
require 'json'

class GetSingleItemService
  def initialize(attributes)
    @item = attributes[:item]
  end

  def call
    api_url = "https://www.googleapis.com/books/v1/volumes/#{@item.google_api_id}"

    return JSON.parse(open(api_url).read)
  end
end

# GetSingleItemService.new(item: Item.find(params[:id])).call
# 
# 
# Item.create(title: "blabla", google_api_id: "ae7897gareg")
# 
