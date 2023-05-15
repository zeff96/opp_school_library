require_relative 'person'

class Student < Person
  attr_accessor :classrom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classrom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
