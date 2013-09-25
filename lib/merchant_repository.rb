class MerchantRepository
  attr_reader :engine

  def initialize(engine)
    @engine = engine
  end

  def merchants
    [ Merchant.new({:id => 1}, self) ]
  end

  def find_by_id(id)
    merchants.detect{|m| m.id == id}
  end

  def items_for(merchant)
    engine.items_for_merchant_id(merchant.id)
  end
end