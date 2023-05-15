class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if @ge >= 18 || @parent_permission
    false
  end

  private

  def of_age?
    return true if @age >= 18
    false
  end
end
