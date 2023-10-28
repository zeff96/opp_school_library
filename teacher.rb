require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def as_json(_options = {})
    super.merge(specialization: @specialization, class_name: 'Teacher')
  end
end
