require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(50, 'Engineer', name: 'Mark') }

  context 'Validate teacher attributes' do
    it 'returns \teacher\'s age' do
      expect(teacher.age).to eq 50
    end
  end
end
