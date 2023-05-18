require_relative 'app'

def list_all_options
  puts 'Please choose an option by entering a number:'
  puts <<~OPTIONS
    1 - List all books.
    2 - List all people.
    3 - Create a person.
    4 - Create a book.
    5 - Create a rental.
    6 - List all rentals for a given person ID.
    7 - Exit.
  OPTIONS
end

HANDLERS = {
  1 => :list_all_books,
  2 => :list_all_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_person_rentals,
  7 => :exit
}.freeze

def handle_option(option, app)
  handler = HANDLERS[option]
  case handler
  when :list_all_books, :list_all_people, :create_book, :create_rental
    app.send(handler)
  when :list_person_rentals
    person_id = prompt_input('Enter the person ID:').to_i
    app.send(handler, person_id)
  when :create_person
    create_person_prompt(app)
  when :exit
    exit_program
    return false
  else
    invalid_option
  end
  true
end

def create_person_prompt(app)
  person_type = prompt_input('Do you want to create a Student(1) or a Teacher(2)? [input the number]: ').to_i
  if person_type == 1
    app.create_person('student')
  elsif person_type == 2
    app.create_person('teacher')
  else
    puts 'Invalid option :('
  end
end

def exit_program
  puts 'Thanks! Exiting...'
end

def invalid_option
  puts 'Invalid number :('
end

def main
  app = App.new
  loop do
    list_all_options
    option = gets.chomp.to_i
    break unless handle_option(option, app)
  end
end

main
