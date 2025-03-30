# frozen_string_literal: true

require_relative "category"

Item = Struct.new(:quantity, :name, :price, keyword_init: true) do
  def category
    @category ||= Category.new(name)
  end
end
