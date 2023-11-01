require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0, 10].strip : name.strip
  end
end
