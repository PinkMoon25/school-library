require 'json'
require_relative 'app'

class Storage
  def store_books(books)
    books.each do |book|
      if(File.size?('./data/books.json'))
        file = File.read('./data/books.json')
        books_file = JSON.parse(file)
        books_file << {title: book.title, author: book.author}

        File.open('./data/books.json', 'w') do |f|
        f.write(JSON.pretty_generate(books_file))
        end
      else
        File.open('./data/books.json', 'w') do |f|
          f.write(JSON.pretty_generate([{title: book.title, author: book.author}]))
        end
      end
    end
  end

  def store_people(people)
    people.each do |person|
      if(File.size?('./data/people.json'))
        file = File.read('./data/people.json')
        people_file = JSON.parse(file)
        people_file << {type: person.class, Name: person.name, Age: person.age}

        File.open('./data/people.json', 'w') do |f|
        f.write(JSON.pretty_generate(people_file))
        end
      else
        File.open('./data/people.json', 'w') do |f|
          f.write(JSON.pretty_generate([{type: person.class, Name: person.name, Age: person.age}]))
        end
      end
    end
  end

  def store_rentals(rentals)
    rentals.each do |rental|
      if(File.size?('./data/rentals.json'))
        file = File.read('./data/rentals.json')
        rentals_file = JSON.parse(file)
        rentals_file << { Date: rental.date, book: rental.book.title, Person: rental.person.name }

        File.open('./data/rentals.json', 'w') do |f|
        f.write(JSON.pretty_generate(rentals_file))
        end
      else
        File.open('./data/rentals.json', 'w') do |f|
          f.write(JSON.pretty_generate([{ Date: rental.date, book: rental.book.title, Person: rental.person.name }]))
        end
      end
    end
  end

  def load_books(app)
    if(File.size?('./data/books.json'))
      file = File.read('./data/books.json')
      stored_books = JSON.parse(file)
      stored_books.map do |b|
        app.books.push(Book.new(b['title'], b['author']))
      end
    end
  end
end

