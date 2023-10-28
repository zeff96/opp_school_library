require_relative 'rental'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    Rental.new(person, self, date)
  end

  def as_json(_options = {})
    {
      title: @title,
      author: @author
    }
  end
end
