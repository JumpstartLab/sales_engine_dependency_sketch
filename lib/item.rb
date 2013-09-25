class Item
  attr_reader :merchant_id

  def initialize(attributes)
    @merchant_id = attributes[:merchant_id]
  end

end