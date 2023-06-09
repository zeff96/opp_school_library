require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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
    person_type = prompt_input('Do you want to create a Student(1) or a Teacher(2)? [input the number]: ').to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option :('
    end
  end

  def create_student
    age = prompt_input('Age: ').to_i
    name = prompt_input('Name: ')
    parent_permission = prompt_yes_no('Has parent permission?')

    student = Student.new(age, name: name, parent_permission: parent_permission)
    @people << student unless student.nil?
    puts 'Student created succesfully!'
  end

  def create_teacher
    age = prompt_input('Age: ').to_i
    name = prompt_input('Name: ')
    specialization = prompt_input('Specialization: ')

    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher unless teacher.nil?
    puts 'Teacher created successfully!'
  end

  def create_book
    title = prompt_input('Title: ')
    author = prompt_input('Author: ')
    @books << Book.new(title, author)
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    @people.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    date = prompt_input('Date: ').to_i
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless rental.nil?
    puts 'Rental created successfully!'
  end

  def list_person_rentals_prompt
    person_id = prompt_input('Enter person ID: ').to_i
    list_person_rentals(person_id)
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

  def exit_program
    puts 'Thanks! Exiting...'
  end

  private

  def prompt_input(message)
    print message
    gets.chomp
  end

  def prompt_yes_no(message)
    val = prompt_input("#{message} (Y/N): ").downcase
    %w[y yes].include?(val)
  end
end
