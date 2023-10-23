module UserInputHandler
  def prompt_input(message)
    print message
    gets.chomp
  end

  def prompt_yes_no(message)
    val = prompt_input("#{message} (Y/N): ").downcase
    %w[y yes n no].include?(val)
  end

  def prompt_person_type
    prompt_input('Do you want to create a Student(1) or a Teacher(2)? [input the number]: ').to_i
  end

  def prompt_age
    prompt_input('Age: ').to_i
  end

  def prompt_name
    prompt_input('Name: ').capitalize
  end

  def prompt_parent_permission
    prompt_yes_no('Has parent permission?')
  end

  def prompt_specialization
    prompt_input('Specialization: ').capitalize
  end

  def prompt_date
    prompt_input('Date: ').to_i
  end
end
