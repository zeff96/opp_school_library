require_relative 'nameable'
require_relative 'decorator'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    return true if of_age || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(person, self, date)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
