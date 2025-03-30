# frozen_string_literal: true

require_relative "../lib/app"

RSpec.describe App do
  describe "#call" do
    subject { described_class.new(input_path) }

    context "input 1" do
      let(:input_path) { File.join(File.dirname(__FILE__), "../input/1.txt") }
      let(:output_content) { "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n" }

      it "processes the input and outputs the receipt" do
        expect { subject.call }.to output(output_content).to_stdout
      end
    end

    context "input 2" do
      let(:input_path) { File.join(File.dirname(__FILE__), "../input/2.txt") }
      let(:output_content) { "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15\n" }

      it "processes the input and outputs the receipt" do
        expect { subject.call }.to output(output_content).to_stdout
      end
    end

    context "input 3" do
      let(:input_path) { File.join(File.dirname(__FILE__), "../input/3.txt") }
      let(:output_content) { "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38\n" }

      it "processes the input and outputs the receipt" do
        expect { subject.call }.to output(output_content).to_stdout
      end
    end
  end
end 
