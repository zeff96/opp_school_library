require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:book) { Book.new('Mathematics', 'Longhorn') }
  let(:person) { Person.new(22, name: 'Test', parent_permission: true) }
  let(:rental) { Rental.new('2023-01-01', book, person) }

  context 'Validates rental attributes' do
    it 'returns rental date' do
      expect(rental.date).to eq '2023-01-01'
    end

    it 'returns rental book' do
      expect(rental.book).to eq book
    end
  end
end
