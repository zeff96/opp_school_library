require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('Computer') }

  context 'Validates classroom attributes' do
    it 'returns classroom label' do
      expect(classroom.label).to eq 'Computer'
    end

    it 'initializes empty students array' do
      expect(classroom.students).to be_empty
    end
  end

  context 'Validates classroom method test' do
    let(:student) { Student.new(15, name: 'test', parent_permission: true) }

    it 'Add student to a classroom' do
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end
