require_relative 'app'

def list_options
  puts <<~OPTIONS

  1 - List all books.
  2 - List all people.
  3 - Create a student.
  4 - Create a teacher.
  5 - Create a book.
  6 - Create a rental.
  7 - List all rentals for a given person ID.
  8 - Exit.

  OPTIONS
end

def handle_option(option, app)
  case option
  when 3
    app.create_person('student')
  when 4
    app.create_person('teacher')
  when 5
    app.create_book
  when 6
    app.create_rental
  when 7
    person_id = prompt_input('Enter person ID:').to_i
    app.list_person_rentals(person_id)
  when 8
    puts 'Thanks! Exiting...'
    return false
  else
    puts 'Invalid number :('
  end

  true
end
