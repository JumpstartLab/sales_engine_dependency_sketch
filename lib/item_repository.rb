class ItemRepository
  attr_reader :items, :engine

  def initialize(engine)
    @engine = engine
  end

  def items
    @items ||= []
  end

  def add(item)
    items << item
  end

  def find_all_by_merchant_id(id)
    @items.select{|i| i.merchant_id == id}
  end
end