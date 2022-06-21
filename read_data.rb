require 'json'

def read_data
  read_books
  read_people
end

def read_books
  file = File.read('books.json')
  books = JSON.parse(file) unless file.chomp.empty?
  @my_app.books = books&.map { |book| Book.new(book[0], book[1]) } || []
end

def read_people
  file = File.read('people.json')
  people = JSON.parse(file) unless file.chomp.empty?
  @my_app.people = people.map do |person|
    if person.length > 3
      Student.new(person[0], person[1], person[2], person[3])
    else
      Teacher.new(person[0], person[1], person[2])
    end
  end || []
end

