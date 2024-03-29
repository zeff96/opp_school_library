require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(50, 'Engineer', name: 'Mark') }

  context 'Validate teacher attributes' do
    it 'returns teacher\'s age' do
      expect(teacher.age).to eq 50
    end

    it 'returns teacher\'s speciliazation' do
      expect(teacher.specialization).to eq 'Engineer'
    end

    it 'returns teacher\'s name' do
      expect(teacher.name).to eq 'Mark'
    end
  end

  context 'Validates teacher method' do
    it 'returns true for can use services' do
      expect(teacher.can_use_services?).to be true
    end

    it 'returns teacher hash' do
      @hash = {
        id: teacher.id,
        age: teacher.age,
        specialization: teacher.specialization,
        name: teacher.name,
        parent_permission: true,
        class_name: 'Teacher'
      }
      expect(teacher.as_json).to eq @hash
    end
  end
end
