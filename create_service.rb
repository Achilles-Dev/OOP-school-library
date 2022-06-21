require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

def create_service(option)
  case option
  when 3
    select_person_input
  when 4
    input_book_details
  when 5
    input_rental_details
  end
end

def select_person_input
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  num = $stdin.gets.to_i
  case num
  when 1
    input_student_details
  when 2
    input_teacher_details
  else
    puts 'Wrong input'
    select_person_input
  end
end

def input_student_details
  print 'Age: '
  age = $stdin.gets.to_i
  print 'Name: '
  name = $stdin.gets.chomp
  print 'Has parent permission? [Y/N]: '
  permission = $stdin.gets.chomp
  classroom = 'Unknown'
  student = Student.new(age, classroom, name, permission)
  @my_app.add_person(student)
  puts 'Person successfully created'
end

def input_teacher_details
  print 'Age: '
  age = $stdin.gets.to_i
  print 'Name: '
  name = $stdin.gets.chomp
  print 'Specialization: '
  specialization = $stdin.gets.chomp
  teacher = Teacher.new(age, specialization, name)
  @my_app.add_person(teacher)
  puts 'Person successfully created'
end

def input_book_details
  print 'Title: '
  title = $stdin.gets.chomp
  print 'Author: '
  author = $stdin.gets.chomp
  book = Book.new(title, author)
  @my_app.add_book(book)
  puts 'Book successfully created'
end

def input_rental_details
  @book_number = nil
  @person_number = nil
  book_selection
  book = @my_app.books[@book_number]
  puts ''
  person_selection
  person = @my_app.people[@person_number]
  puts ''
  print 'Date (YYYY/MM/DD): '
  date = $stdin.gets
  rental = Rental.new(date, book, person)
  @my_app.add_rental(rental)
  puts 'Rental created succesfully'
end

def book_selection
  puts 'Select a book from the following list by number (not id)'
  @my_app.all_books.map.with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  @book_number = gets.chomp.to_i
  book = @my_app.books[@book_number]
  puts 'Book selected not in the list' && book_selection if book.nil?
end

def person_selection
  puts 'Select a person from the following list by number (not id)'
  @my_app.all_people.map.with_index do |person, index|
    puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  @person_number = gets.chomp.to_i
  person = @my_app.people[@person_number]
  puts 'Person selected not in the list' && person_selection if person.nil?
end
