module UserInputHandler
  def prompt_input(message)
    print message
    gets.chomp
  end
end
