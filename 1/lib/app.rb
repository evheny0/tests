# frozen_string_literal: true

require_relative "input_parser"
require_relative "calculator"
require_relative "printer"

class App
  def initialize(input_path)
    @input_path = input_path
  end

  def call
    input_items = InputParser.from_file(@input_path).parse
    calculator = Calculator.new(input_items)
    receipt = calculator.call
    Printer.new(receipt).print
  end
end
