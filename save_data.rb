require 'json'

def save_data
  save_book
end

def save_book
  books_array = @my_app.books.map { |book| [book.title, book.author] }
  books = JSON.generate(books_array)
  File.write('books.json', books)
end
