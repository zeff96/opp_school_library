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

  def create_book
    title = prompt_input('Title:')
    author = prompt_input('Author:')
    @books << Book.new(title, author)
    puts "Book created successfully!"
  end

  def create_rental
    book = prompt_selection('book', @books)
    person = prompt_selection('person', @people)
    return unless book && person

    date = prompt_input('Date:')
    Rental.new(book, person, date)
    puts "Rental created succesfully!"
  end

  def list_person_rentals(person.id)
    person = @people.find{|p| p.id == person.id}

    if person
      puts 'Rentals:'
      display_items(person.rentals) {|rental| "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"}
    else
      puts "Person not found!"
    end
  end

  private

  def display_items(items)
    items.each{|item| puts yield(item)}
  end

  def collect_person_info(type)
    age = prompt_input('Age:')
    name = prompt_input('Name:')
    parent_permission = prompt_yes_no('Has parent permission?')
    specialization = (type == 'teacher') ? prompt_input('Specialization:') : nil

    [age, name, parent_permission, specialization]
  end