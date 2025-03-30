# frozen_string_literal: true

class Receipt
  Item = Struct.new(:name, :total_price, :tax, :quantity)

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(name:, total_price:, tax:, quantity:)
    @items << Item.new(name, total_price, tax, quantity)
  end

  def total
    @items.sum(0, &:total_price)
  end

  def sales_taxes
    @items.sum(0, &:tax)
  end
end
