# frozen_string_literal: true

require_relative "../input_parser"

RSpec.describe InputParser do
  describe ".from_file" do
    let(:file_path) { File.join(File.dirname(__FILE__), "../input/1.txt") }

    it "reads the file and parses it as an input" do
      parser = described_class.from_file(file_path)
      expect(parser.parse.size).to eq(3)
    end
  end

  describe "#parse" do
    let(:input) { "2 book at 12.49\n1 music CD at 14.99" }
    subject { described_class.new(input) }

    it "parses lines into Item objects" do
      result = subject.parse
      expect(result.size).to eq(2)
      
      expect(result[0]).to be_an(Item)
      expect(result[0].quantity).to eq(2)
      expect(result[0].name).to eq("book")
      expect(result[0].price).to eq(BigDecimal("12.49"))
      
      expect(result[1]).to be_an(Item)
      expect(result[1].quantity).to eq(1)
      expect(result[1].name).to eq("music CD")
      expect(result[1].price).to eq(BigDecimal("14.99"))
    end

    it "handles empty input" do
      parser = described_class.new("")
      expect(parser.parse).to eq([])
    end

    it "raises error for invalid format" do
      parser = described_class.new("invalid line")
      expect { parser.parse }.to raise_error("Could not parse line: `invalid line`")
    end
  end
end 
