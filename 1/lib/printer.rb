# frozen_string_literal: true

class Printer
  def initialize(receipt)
    @receipt = receipt
  end

  def print
    @receipt.items.each do |item|
      puts "#{item.quantity} #{item.name}: #{'%.2f' % item.price_with_tax}"
    end

    puts "Sales Taxes: #{'%.2f' % @receipt.sales_taxes}"
    puts "Total: #{'%.2f' % @receipt.total}"
  end
end
