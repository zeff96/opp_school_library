require_relative 'person';

class Student < Person
  def initialize(age, classrom, name = "Unknown", parent_permission = true)
    super(age, name, parent_permission)
    @classrom = classrom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end