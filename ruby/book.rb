class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @author = author
    @title = title
    @rental = []
  end

  def add_rentals(rental)
    @rental.push(rental)
    rental.book = self
  end
end
