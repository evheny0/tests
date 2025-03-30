# frozen_string_literal: true

require_relative "utils"

module Taxes
  class ImportDuty
    def self.applies_to?(item)
      item.category.imported?
    end
  
    def self.tax_rate(price)
      Utils.round_up_to_nearest_0_05(price * BigDecimal("0.05"))
    end
  end
end
