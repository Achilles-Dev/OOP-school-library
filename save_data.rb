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
  people_array = @my_app.people.map do |person|
    if person.instance_of?(Teacher)
      [person.age, person.specialization,
       person.name]
    else
      [person.age, person.classroom, person.name, person.parent_permission]
    end
  end
  people = JSON.generate(people_array)
  File.write('people.json', people)
end
