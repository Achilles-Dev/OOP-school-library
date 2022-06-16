require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_books
    books.map { |book| puts "title: #{book.name}, author: #{book.address}" }
  end

  def all_people
    people.map do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def add_person(num, age, name, arg)
    case num
    when 1
      classroom = 'Unknown'
      student = Student.new(age, classroom, name, arg)
      people.push(student)
    when 2
      teacher = Teacher.new(age, arg, name)
      people.push(teacher)
    else 'Invalid person'
    end
  end

  def add_book(title, author)
    book = Book.new(title, author)
    books.push(book)
  end

  def add_rental(date, book_number, person_number)
    book_rent = books.map { |book| book[book_number] }
    person_rent = people.map { |person| person[person_number] }
    rental = Rental.new(date, book_rent, person_rent)
    rentals.push(rental)
  end

  def rental_by_id(person_id)
    rentals.select { |rental| rental.person.id == person_id }
      .map { |rental| puts "Date: #{rental.date}, Book: #{rental.book.name} by #{rental.person.name}" }
  end
end
