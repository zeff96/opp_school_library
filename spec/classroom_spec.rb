require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classrom) { Classroom.new('Computer') }

  context 'Validates classroom attributes' do
    it 'returns classroom label' do
      expect(classrom.label).to eq 'Computer'
    end

    it 'initializes empty students array' do
      expect(classrom.students).to be_empty
    end
  end
end
