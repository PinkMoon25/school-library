class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @author = author
    @title = title
    @rental = []
  end
end
