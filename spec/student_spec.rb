require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:student) { Student.new(15, name: 'test', parent_permission: true) }

  context 'Validates student attributes' do
    it 'returns students age' do
      expect(student.age).to eq 15
    end

    it 'returns student name' do
      expect(student.name).to eq 'test'
    end

    it 'returns student parent permission' do
      expect(student.parent_permission).to be true
    end
  end

  context 'Assigns student to a given class' do
    let(:classroom) { Classroom.new('Computer') }
    it 'Assigns student to a classroom' do
      student.classroom = (classroom)
      expect(classroom.students).to include(student)
    end
  end

  context 'Validates student method test' do
    it 'validates student play hooky method' do
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
