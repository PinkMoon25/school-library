class Rental
  attr_accessor :date, :book

  def initialize(date)
    @date = date
  end

  def add_book(book)
    @book = book
    book.rental.push(self) unless book.rental.include?(self)
  end
end
