#!/usr/bin/env ruby
require_relative 'app'

def main
  app = App.new()
  app.run
  puts 'Please select an option by entering th foloowing number:

  1. List all books
  2. List all people
  3. Create a person (teacher or student)
  4. Create a book
  5. Create a rental
  6. List all rentals for a given person id
  7. Exit'

  user_input = gets.chomp.to_i

  case user_input
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    puts "Thanks for using the app"
    exit
  else
    puts "oops something is not right"
    exit
  end
end

main()
