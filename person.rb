require_relative 'nameable'
require_relative 'decorator'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :book
  attr_accessor :name, :age, :parent_permission, :rental

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def as_json(_options = {})
    {
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission
    }
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
