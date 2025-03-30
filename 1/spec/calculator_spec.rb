# frozen_string_literal: true

require_relative "../calculator"
require_relative "../item"

describe Calculator do
  let(:item1) { Item.new(name: "book", price: 10, quantity: 2) }
  let(:item2) { Item.new(name: "chocolate", price: 15, quantity: 3) }
  let(:items) { [item1, item2] }

  it "calculates total prices for each item" do
    calculator = described_class.new(items)
    expect(calculator.call).to eq([20, 45])
  end

  it "handles an empty item list" do
    calculator = described_class.new([])
    expect(calculator.call).to eq([])
  end
end
