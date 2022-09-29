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

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Parent Permission (Y/N): '
    permission = gets.chomp
    parent_permission = !(permission.downcase == 'n' || permission.downcase == 'no')
    @people.push(Student.new(age, classroom, name, parent_permission: parent_permission))
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    print 'Name: '
    name = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts 'Teacher created successfully'
  end

  def create_person
    print 'Create a Student(1) or a Teacher(2)? [Input number]: '
    user_input = gets.chomp.to_i
    case user_input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Incorrect input'
    end
  end
end

app = App.new
app.create_person
p app.people
