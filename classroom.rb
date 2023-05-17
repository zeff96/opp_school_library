class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    student.classrom = self
    @student << student
  end
end