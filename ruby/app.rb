
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'nameable'
require_relative 'classroom'
require_relative 'decorator'

class App
  attr_reader :books, :people, :rentals
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author)) if title && author
    puts 'Book created successfully'
  end

end

app = App.new()
app.create_book