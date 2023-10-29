require_relative '../person'

describe Person do
  let(:person) { Person.new(22, name: 'Test', parent_permission: false) }
  context 'validates presence of person class attributes' do
    it 'returns person age' do
      expect(person.age).to eq(22)
    end

    it 'returns persons name' do
      expect(person.name).to eq 'Test'
    end

    it 'returns persons parent_permission' do
      expect(person.parent_permission).to be_falsy
    end

    it 'returns empty rental' do
      expect(person.rental).to be_empty
    end
  end
end
