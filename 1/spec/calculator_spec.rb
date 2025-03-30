# frozen_string_literal: true

require_relative "../calculator"

describe "Calculator" do
  it "somehow works" do
    calculator = Calculator.new
    expect(calculator.call).to eq(nil)
  end
end
