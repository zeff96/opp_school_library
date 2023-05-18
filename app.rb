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

  def list_all_peoples
    display_items(@people) do |person|
      "[#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

 