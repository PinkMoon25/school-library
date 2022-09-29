require_relative 'rental'
require_relative 'person'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @author = author
    @title = title
    @rental = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
