# frozen_string_literal: true

class Category
  TYPES = [:book, :food, :medical, :other]

  def initialize(name)
    @name = name
  end

  # I wrote category detection only based on the given input,
  #   making it flexible enough with regex. I believe that
  #   for a more appropriate solution it should have more
  #   eloquent category detection.
  def type
    @type ||= case @name
    when /book/i
      :book
    when /chocolate/i
      :food
    when /pill/i
      :medical
    else
      :other
    end
  end

  def imported?
    @imported ||= @name.include?("imported")
  end
end
