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

  def create_person(type)
    person_info = collect_person_info(type)
    return unless person_info

    if type == 'Teacher'
      @people << Teacher.new(*person_info)
    elsif type == 'Student'
      @people << Student.new(*person_info)
    end

    puts "#{type.capitalize} created successfully!"
  end

