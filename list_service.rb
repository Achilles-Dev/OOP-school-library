def list_service(option)
  case option
  when 1
    select_all_books
    main
  when 2
    select_all_people
    main
  when 6
    list_rental_by_person_id
    main
  end
end

def select_all_books
  @my_app.all_books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
end

def select_all_people
  @my_app.all_people.map { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
end

def list_rental_by_person_id
  print 'ID of person: '
  person_id = $stdin.gets.to_i
  puts 'Rentals: '
  @my_app.rental_by_id(person_id)
end
