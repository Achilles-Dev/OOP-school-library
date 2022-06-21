require 'json'

def read_data
  file = File.read('books.json')
  p file.class
  books = JSON.parse(file) unless file.chomp.empty?
  @my_app.books = books.map { |book| Book.new(book[0], book[1]) }
  p @my_app.books
end

