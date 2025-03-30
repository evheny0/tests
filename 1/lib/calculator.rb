# frozen_string_literal: true

require_relative "receipt"
require_relative "taxes/basic_sales_tax"
require_relative "taxes/import_duty"

class Calculator
  TAXES = [Taxes::BasicSalesTax, Taxes::ImportDuty].freeze

  def initialize(input_items)
    @input_items = input_items
    @receipt = Receipt.new
  end

  def call
    @input_items.each do |item|
      tax = tax_for(item)

      @receipt.add_item(
        name: item.name,
        price: item.price * item.quantity,
        tax: tax * item.quantity,
        quantity: item.quantity,
      )
    end

    @receipt
  end

  private

  def tax_for(item)
    TAXES.sum do |tax|
      tax.applies_to?(item) ? tax.tax_rate(item.price) : 0
    end
  end
end
