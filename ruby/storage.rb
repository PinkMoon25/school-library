require 'json'

class Storage
  def store_books(books)
    file = File.open('./data/books.json', 'a') do |f|
      books.each do |book|
        f << (JSON.pretty_generate(['title': book.title,'author': book.author]))
      end
    end
  end

  def store_people(people)
    file = File.open('./data/people.json', 'a') do |f|
      people.each do |people|
      f.write(JSON.pretty_generate(['type': people.class,'Name': people.name, 'Age': people.age]))
      end
    end
  end

  def store_rentals(rentals)
    file = File.open('./data/rentals.json', 'a') do |f|
      rentals.each do |rental|
      f.write(JSON.pretty_generate(['Date': rental.date,'book': rental.book.title, 'Person': rental.person.name]))
      end
    end
  end
end

