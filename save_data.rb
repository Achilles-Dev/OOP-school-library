require 'json'

def save_data
  save_book
  save_person
  save_rental
end

def save_book
  books_array = @my_app.books.map do |book|
    { class_instance: 'Book', title: book.title, author: book.author }
  end
  books = JSON.generate(books_array)
  File.write('books.json', books)
end

def save_person
  people_array = @my_app.people.map do |person|
    if person.instance_of?(Teacher)
      { class_instance: 'Teacher', id: person.id, age: person.age, specialization: person.specialization,
        name: person.name }
    else
      { class_instance: 'Student', id: person.id, age: person.age, classroom: person.classroom,
        name: person.name, parent_permission: person.parent_permission }
    end
  end
  people = JSON.generate(people_array)
  File.write('people.json', people)
end

def save_rental
  rental_array = @my_app.rentals.map do |rental|
    [class_instance: 'Rental', date: rental.date, book_title: rental.book.title, person_id: rental.person.id]
  end
  rentals = JSON.generate(rental_array)
  File.write('rentals.json', rentals)
end
