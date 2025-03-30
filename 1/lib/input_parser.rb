# frozen_string_literal: true

require "bigdecimal"
require_relative "item"

class InputParser
  LINE_REGEX = /(\d+)\s+(.+)\s+at\s+(\d+\.\d+)/
  
  def self.from_file(file_path)
    new(File.read(file_path))
  end

  def initialize(input)
    @input = input
  end

  def parse
    @input.split("\n").map do |line|
      if match = line.match(LINE_REGEX)
        quantity = match[1].to_i
        name = match[2]
        price = BigDecimal(match[3])
        Item.new(quantity:, name:, price:)
      else
        raise "Could not parse line: `#{line}`"
      end
    end
  end
end
