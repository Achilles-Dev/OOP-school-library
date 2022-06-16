#!/usr/bin/env ruby

require_relative 'app'

@my_app = App.new

def main
  app_description

  option = gets.chomp.to_i

  select_option(option)
end

def select_option(option)
  case option
  when 1..2
    list_part(option)
    main
  when 3..5
    create_part(option)
    main
  when 6
    list_rental_by_person_id
    main
  when 7
    puts 'Goodbye'
  else
    puts 'Choose a correct option'
  end
end

def list_part(option)
  case option
  when 1
    select_all_books
    main
  when 2
    select_all_people
    main
  end
end

def create_part(option)
  case option
  when 3
    select_person_input
  when 4
    input_book_details
  when 5
    input_rental_details
  end
end

def select_all_books
  @my_app.all_books
end

def select_all_people
  @my_app.all_people
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

def app_description
  puts 'Welcome to School library App!'
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
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
  puts 'Select a book from the follwing list by number (not id)'
  @my_app.all_books
  book_number = gets.chomp.to_i
  puts ''
  puts 'Select a person from the follwing list by number (not id)'
  @my_app.all_people
  person_number = gets.chomp.to_i
  puts ''
  print 'Date: '
  date = $stdin.gets
  @my_app.add_rental(date, book_number, person_number)
  puts 'Rental created succesfully'
end

def list_rental_by_person_id
  print 'ID of person: '
  person_id = $stdin.gets.to_i
  puts 'Rentals: '
  @my_app.rental_by_id(person_id)
end
main
