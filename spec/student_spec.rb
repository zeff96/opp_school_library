require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:student) { Student.new(15, name: 'test', parent_permission: true) }

  context 'Validates student attributes' do
    it 'returns students age' do
      expect(student.age).to eq 15
    end
  end
end
