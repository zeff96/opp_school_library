require_relative '../person'

describe Person do
  let(:person) { Person.new(22, name: 'Test', parent_permission: 'Yes') }
  context 'validates presence of person class attributes' do
    it 'returns person age' do
      expect(person.age).to eq(22)
    end

    it 'returns persons name' do
      expect(person.name).to eq 'Test'
    end
  end
end
