require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_all_books
    display_items(@books) {|book| "Title: #{book.title}   Author: #{book.author}"}
  end

