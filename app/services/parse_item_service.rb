class ParseItemService
  def initialize(attributes)
    @item = attributes[:item]
    @items = attributes[:items]
  end

  def call
    if @items
      parse_multiple(@items)
    else
      parse_single(@item)
    end
  end

  private

  def parse_single(item)
    Item.new(
      title: item["volumeInfo"]["title"],
      content: item["volumeInfo"]["description"],
      author: item["volumeInfo"]["authors"] ? item["volumeInfo"]["authors"].join(" ") : nil,
      publishing_date: item["volumeInfo"]["publishedDate"],
      thumbnail: item["volumeInfo"]["imageLinks"] ? item["volumeInfo"]["imageLinks"]["thumbnail"] : nil,
      google_api_id: item["id"]
      )
  end

  def parse_multiple(items)
    results = []
    @items.each do |item|
      results << parse_single(item)
    end
    results
  end

end