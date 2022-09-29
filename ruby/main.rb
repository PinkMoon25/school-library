#!/usr/bin/env ruby
require_relative 'app'

puts "Welcome to school library app
\n"

def main(app = App.new())
  puts 'Please select an option by entering the following number:

    1. List all books
    2. List all people
    3. Create a person (teacher or student)
    4. Create a book
    5. Create a rental
    6. List all rentals for a given person id
    7. Exit'

  user_input = gets.chomp.to_i
  select_method(user_input, app)
  if user_input == 7
    puts 'Thank you for using the app'
    exit
  end
  main(app)
end

def select_method(input, app)
  case input
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
  end
end

main
