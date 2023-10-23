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
end
