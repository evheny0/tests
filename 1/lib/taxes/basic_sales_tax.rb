# frozen_string_literal: true

require "bigdecimal"
require_relative "utils"

module Taxes
  class BasicSalesTax
    EXEMPTION_CATEGORIES = [:food, :medical, :book].freeze

    def self.applies_to?(item)
      !EXEMPTION_CATEGORIES.include?(item.category.type)
    end
  
    def self.tax_rate(price)
      Utils.round_up_to_nearest_0_05(price * BigDecimal("0.1"))
    end  
  end
end
