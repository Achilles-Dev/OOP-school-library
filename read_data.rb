require 'json'

def read_data
  read_books
  read_people
end

def read_books
  file = File.read('books.json')
  books = JSON.parse(file) unless file.chomp.empty?
  @my_app.books = books&.map { |book| Book.new(book['title'], book['author']) } || []
end

def read_people
  file = File.read('people.json')
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
