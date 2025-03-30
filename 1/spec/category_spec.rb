# frozen_string_literal: true

require_relative "../category"

RSpec.describe Category do
  describe "#type" do
    it "returns :book for items containing 'book'" do
      category = described_class.new("book")
      expect(category.type).to eq(:book)
    end

    it "returns :food for items containing 'chocolate'" do
      category = described_class.new("chocolate bar")
      expect(category.type).to eq(:food)
    end

    it "returns :medical for items containing 'pill'" do
      category = described_class.new("imported headache pills")
      expect(category.type).to eq(:medical)
    end

    it "returns :other for items not matching any specific category" do
      category = described_class.new("music CD")
      expect(category.type).to eq(:other)
    end

    it "is case insensitive" do
      category = described_class.new("BOOK")
      expect(category.type).to eq(:book)
    end
  end

  describe "#imported?" do
    it "returns true when item name contains 'imported'" do
      category = described_class.new("imported chocolates")
      expect(category.imported?).to be true
    end

    it "returns false when item name does not contain 'imported'" do
      category = described_class.new("book")
      expect(category.imported?).to be false
    end
  end
end 
