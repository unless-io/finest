class CacheItemService
  def initialize(attributes)
    @items = attributes[:items]
  end

  def call
    set_multiple(@items)
  end

  private

  def set_multiple(items)
    items.each do |item|
      set_single(item)
    end
  end

  def set_single(item)
    $redis.set(item["id"], item.to_json)
  end
end