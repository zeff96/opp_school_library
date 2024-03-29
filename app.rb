require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'modules/user_inputs'
require_relative 'storage'

class App
  include UserInputHandler
  def initialize
    @data_manager = DataManager.new('data')
    @books = load_books_data
    @people = load_people_data
    @rentals = load_rentals_data
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}   Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_person_prompt
    person_type = prompt_person_type
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option :('
    end
  end

  def create_book
    title = prompt_title
    author = prompt_author
    @books << Book.new(title, author)
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = prompt_index
    puts 'Select a person from the following list by number (not ID)'
    @people.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = prompt_index
    date = prompt_date
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless rental.nil?
    puts 'Rental created successfully!'
  end

  def list_person_rentals_prompt
    person_id = prompt_person_id
    list_person_rentals(person_id)
  end

  def exit_program
    save_person_json
    save_books_json
    save_rentals_json
    puts 'Thanks! Exiting...'
  end

  private

  def create_student
    age = prompt_age
    name = prompt_name
    parent_permission = prompt_parent_permission

    student = Student.new(age, name: name, parent_permission: parent_permission)
    @people << student unless student.nil?
    puts 'Student created succesfully!'
  end

  def create_teacher
    age = prompt_age
    name = prompt_name
    specialization = prompt_specialization

    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher unless teacher.nil?
    puts 'Teacher created successfully!'
  end

  def list_person_rentals(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts 'Rentals:'
      person.rental.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'Person not found!'
    end
  end

  def save_person_json
    filename = 'people.json'
    people_json = @people.map(&:as_json)

    @data_manager.save_to_json(people_json, filename)
  end

  def load_people_data
    @data_manager.load_from_json('people.json', []) do |json_data|
      @data_manager.decentralize_person(json_data)
    end
  end

  def save_books_json
    filename = 'books.json'
    json_data = @books.map(&:as_json)

    @data_manager.save_to_json(json_data, filename)
  end

  def load_books_data
    @data_manager.load_from_json('books.json', []) do |json_data|
      @data_manager.decentralize_books(json_data)
    end
  end

  def save_rentals_json
    filename = 'rentals.json'
    json_data = @rentals.map(&:as_json)

    @data_manager.save_to_json(json_data, filename)
  end

  def load_rentals_data
    @data_manager.load_from_json('rentals.json', []) do |json_data|
      @data_manager.decentralize_rentals(json_data)
    end
  end
end
