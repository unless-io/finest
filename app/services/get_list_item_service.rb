require 'open-uri'
require 'json'

class GetListItemService
  def initialize(attributes)
    @query = attributes[:query]
  end

  def call
    api_url = "https://www.googleapis.com/books/v1/volumes?q=#{@query}&country=UK"

    return JSON.parse(open(api_url).read)
  end
end