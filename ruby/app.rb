require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'nameable'
require_relative 'classroom'
require_relative 'decorator'
require_relative 'storage'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    Storage.load_books(books)
    Storage.load_people(people)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    if File.size?('./data/books.json')
      file = File.read('./data/books.json')
      books_file = JSON.parse(file)
      books_file << { title: title, author: author }
      File.write('./data/books.json', JSON.pretty_generate(books_file))
    else
      File.write('./data/books.json', JSON.pretty_generate([{ title: title, author: author }]))
    end
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
    if File.size?('./data/people.json')
      file = File.read('./data/people.json')
      student_file = JSON.parse(file)
      student_file << { type: 'Student', Classroom: classroom, Name: name, Age: age }
      File.write('./data/people.json', JSON.pretty_generate(student_file))
    else
      File.write('./data/people.json',
                 JSON.pretty_generate([{ type: 'Student', Classroom: classroom, Name: name, Age: age }]))
    end
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
    if File.size?('./data/people.json')
      file = File.read('./data/people.json')
      teacher_file = JSON.parse(file)
      teacher_file << { type: 'Teacher', specialization: specialization, Name: name, Age: age }
      File.write('./data/people.json', JSON.pretty_generate(teacher_file))
    else
      File.write('./data/people.json',
                 JSON.pretty_generate([{ type: 'Teacher', specialization: specialization, Name: name, Age: age }]))
    end
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

  def list_books
    @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each_with_index { |p, idx| puts "#{idx}) [#{p.class}] Name: #{p.name}, Age: #{p.age}, Id: #{p.id}" }
  end

  def create_rental
    puts 'Select Book from the list by number:'
    list_books
    user_input_book = gets.chomp.to_i
    book = @books[user_input_book]
    puts 'Select a person from the list by number(not id):'
    list_people
    user_input_person = gets.chomp.to_i
    person = @people[user_input_person]
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, book, person)) if book && person
    save_rentals(date, book, person)
    puts 'Rental created successfully'
  end

  def save_rentals(date, book, person)
    if File.size?('./data/rentals.json')
      file = File.read('./data/rentals.json')
      rentals_file = JSON.parse(file)
      rentals_file << { Date: date, title: book.title, author: book.author, age: person.age,
                        name: person.name, id: person.id }
      File.write('./data/rentals.json', JSON.pretty_generate(rentals_file))
    else
      File.write('./data/rentals.json',
                 JSON.pretty_generate([{ Date: date, title: book.title, author: book.author, age: person.age,
                                         name: person.name, id: person.id }]))
    end
  end

  def list_rentals
    print 'Id of the Person: '
    id = gets.chomp.to_i
    rentals_file = Storage.load_rentals
    select_rentals = rentals_file.select { |i| i['id'].to_i == id }
    puts "No person with id: #{id} check rentals.json for the id" if select_rentals.empty?
    select_rentals.each { |r| puts "Date: #{r['Date']}, Book #{r['title']} by #{r['author']}" }
  end
end
