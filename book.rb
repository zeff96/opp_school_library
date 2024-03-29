require_relative 'rental'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def as_json(_options = {})
    {
      title: @title,
      author: @author
    }
  end
end
