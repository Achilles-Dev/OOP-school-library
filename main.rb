#!/usr/bin/env ruby

require_relative 'app'
require_relative 'create_service'
require_relative 'list_service'

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
  when 1..2, 6
    list_service(option)
    main
  when 3..5
    create_service(option)
    main
  when 7
    puts 'Goodbye'
    exit
  else
    puts 'Choose a correct option'
    main
  end
end

main
