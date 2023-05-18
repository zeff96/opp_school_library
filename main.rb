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
