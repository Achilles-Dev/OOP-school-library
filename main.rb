#!/usr/bin/env ruby

require_relative 'app'
require_relative 'create_service'

@my_app = App.new

def main
  app_description

  option = gets.chomp.to_i

  select_option(option)
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

def select_option(option)
  case option
  when 1..2
    list_part(option)
    main
  when 3..5
    create_service(option)
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

def select_all_books
  @my_app.all_books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
end

def select_all_people
  @my_app.all_people.map { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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

def list_rental_by_person_id
  print 'ID of person: '
  person_id = $stdin.gets.to_i
  puts 'Rentals: '
  @my_app.rental_by_id(person_id)
end
main
