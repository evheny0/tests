# frozen_string_literal: true

require_relative "receipt"

class Calculator
  def initialize(items)
    @items = items
    @receipt = Receipt.new
  end

  def call
    @items.each do |item|
      @receipt.add_item(
        name: item.name,
        total_price: item.price * item.quantity,
        tax: 0,
        quantity: item.quantity
      )
    end

    @receipt
  end
end
