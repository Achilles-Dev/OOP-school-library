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
    input_student_details(num)
  when 2
    input_teacher_details(num)
  else
    print 'Input correct number: '
    num = $stdin.gets.to_i
    select_input(num)
  end
end

def input_student_details(num)
  print 'Age: '
  age = $stdin.gets.to_i
  print 'Name: '
  name = $stdin.gets.chomp
  print 'Has parent permission? [Y/N]: '
  permission = $stdin.gets
  @my_app.add_person(num, age, name, permission)
  puts 'Person successfully created'
end

def input_teacher_details(num)
  print 'Age: '
  age = $stdin.gets.to_i
  print 'Name: '
  name = $stdin.gets.chomp
  print 'Specialization: '
  specialization = $stdin.gets.chomp
  @my_app.add_person(num, age, name, specialization)
  puts 'Person successfully created'
end

def input_book_details
  print 'Title: '
  title = $stdin.gets.chomp
  print 'Author: '
  author = $stdin.gets.chomp
  @my_app.add_book(title, author)
  puts 'Book successfully created'
end

def input_rental_details
  puts 'Select a book from the following list by number (not id)'
  @my_app.all_books.map.with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  book_number = gets.chomp.to_i
  puts ''
  puts 'Select a person from the follwing list by number (not id)'
  @my_app.all_people.map.with_index do |person, index|
    puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_number = gets.chomp.to_i
  puts ''
  print 'Date: '
  date = $stdin.gets
  @my_app.add_rental(date, book_number, person_number)
  puts 'Rental created succesfully'
end
