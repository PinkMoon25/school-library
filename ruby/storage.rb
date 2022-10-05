require 'json'
require_relative 'app'

class Storage
  def self.load_books(books)
    return unless File.size?('./data/books.json')

    file = File.read('./data/books.json')
    stored_books = JSON.parse(file)
    stored_books.map do |b|
      books << (Book.new(b['title'], b['author']))
    end
  end

  def self.load_people(people)
    return unless File.size?('./data/people.json')

    file = File.read('./data/people.json')
    stored_people = JSON.parse(file)
    stored_people.map do |p|
      people << (Student.new(p['Age'], p['Classroom'], p['Name'])) if p['type'] == 'Student'
      people << (Teacher.new(p['Age'], p['specialization'], p['Name'])) if p['type'] == 'Teacher'
    end
  end

  def self.load_rentals
    return unless File.size?('./data/rentals.json')

    file = File.read('./data/rentals.json')
    JSON.parse(file)
  end
end
