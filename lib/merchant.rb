class Merchant
  attr_reader :id, :repository

  def initialize(attributes, repository)
    @id = attributes[:id]
    @repository = repository
  end

  def items
    repository.items_for(self)
  end
end