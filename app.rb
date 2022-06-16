require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @book = nil
    @people = []
    @person = nil
    @rentals = []
  end

  def all_books
    books
  end

  def all_people
    people
  end

  def add_person(num, age, name, arg)
    case num
    when 1
      classroom = 'Unknown'
      student = Student.new(age, classroom, name, arg)
      @people << student unless @people.include?(student)
    when 2
      teacher = Teacher.new(age, arg, name)
      @people << teacher unless @people.include?(teacher)
    else 'Invalid person'
    end
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
  end

  def add_rental(date, book_number, person_number)
    @book = @books[book_number]
    @person = @people[person_number]
    rental = Rental.new(date, @book, @person)
    @rentals << rental unless @rentals.include?(rental)
  end

  def rental_by_id(person_id)
    @rentals.select { |rental| rental.person.id == person_id }
      .map { |rental| print "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
  end
end
