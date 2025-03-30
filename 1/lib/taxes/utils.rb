# frozen_string_literal: true

module Taxes
  module Utils
    def self.round_up_to_nearest_0_05(amount)
      (amount * 20).ceil / BigDecimal(20)
    end
  end
end
