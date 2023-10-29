require_relative '../person'
require_relative '../book'
require_relative '../rental'

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

  context 'can use services method and correct name method' do
    it 'returns true for can use services' do
      expect(person.can_use_services?).to be_truthy
    end

    it 'correct name method returns person correct name' do
      expect(person.correct_name).to eq 'Test'
    end
  end

  context 'add rental method test' do
    let(:book) { Book.new('Mathematics', 'Longhorn') }
    let(:rental) { Rental.new('2023-10-10', book, person) }

    before(:each) do
      person.add_rental('2023-10-10', book)
    end

    it 'Add person rentals' do
      expect(person.rental.length).to eq 1
    end
  end
end
