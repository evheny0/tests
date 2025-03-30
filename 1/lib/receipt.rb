# frozen_string_literal: true

class Receipt
  Item = Struct.new(:name, :price, :tax, :quantity) do
    def price_with_tax
      price + tax
    end
  end

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(name:, price:, tax:, quantity:)
    @items << Item.new(name, price, tax, quantity)
  end

  def total
    @items.sum(0, &:price_with_tax)
  end

  def sales_taxes
    @items.sum(0, &:tax)
  end
end
