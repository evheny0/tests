# frozen_string_literal: true

require_relative "../lib/calculator"
require_relative "../lib/item"

describe Calculator do
  let(:item1) { Item.new(name: "imported book", price: 10, quantity: 2) }
  let(:item2) { Item.new(name: "other thing", price: 15, quantity: 3) }
  let(:items) { [item1, item2] }

  it "calculates total prices for each item" do
    receipt = described_class.new(items).call
    expect(receipt.items.map(&:price)).to eq([20, 45])
    expect(receipt.items.map(&:price_with_tax)).to eq([21, 49.5])
    expect(receipt.total).to eq(70.5)
    expect(receipt.sales_taxes).to eq(5.5)
  end

  it "handles an empty item list" do
    receipt = described_class.new([]).call
    expect(receipt.total).to eq(0)
    expect(receipt.sales_taxes).to eq(0)
  end
end
