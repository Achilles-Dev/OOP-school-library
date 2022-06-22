require 'json'

def read_data
  read_books
  read_people
  read_rentals
end

def read_books
  file = File.read('books.json') if File.exist?('books.json')
  books = JSON.parse(file) unless file.chomp.empty?
  @my_app.books = books&.map { |book| Book.new(book['title'], book['author']) } || []
end

def read_people
  file = File.read('people.json') if File.exist?('people.json')
  people = JSON.parse(file) unless file.chomp.empty?
  people&.map do |person|
    if person['class_instance'] == 'Student'
      student = Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
      student.id = person['id']
      @my_app.people.push(student)
    else
      teacher = Teacher.new(person['age'], person['specialization'], person['name'])
      teacher.id = person['id']
      @my_app.people.push(teacher)
    end
  end || []
end

def read_rentals
  file = File.read('rentals.json') if File.exist?('rentals.json')
  rentals = JSON.parse(file) unless file.chomp.empty?
  add_rental(rentals)
end

def add_rental(rentals)
  @my_app.rentals = rentals&.map do |rental|
    book = @my_app.books.find { |bk| bk.title == rental['book_title'] }
    person = @my_app.people.find { |pers| pers.id == rental['person_id'] }
    Rental.new(rental['date'], book, person)
  end || []
end
