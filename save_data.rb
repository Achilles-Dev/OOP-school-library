require 'json'

def save_data
  save_book
  save_person
end

def save_book
  books_array = @my_app.books.map { |book| [book.title, book.author] }
  books = JSON.generate(books_array)
  File.write('books.json', books)
end

def save_person
  people_array = @my_app.people.map { |person| 
    person.class == Teacher ? [person.age, person.specialization, person.name] : [person.age, person.classroom, person.name, person.parent_permission]
  }
  people = JSON.generate(people_array)
  File.write('people.json', people)
end
