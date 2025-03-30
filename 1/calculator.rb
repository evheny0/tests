# frozen_string_literal: true

class Calculator
  def initialize(items)
    @items = items
  end

  def call
    @items.map do |item|
      item.price * item.quantity
    end
  end
end
