require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('Mathematics', 'Longhorn') }
  context 'Validates presence of book attributes' do
    it 'returns book title' do
      expect(book.title).to eq 'Mathematics'
    end

    it 'returns book author' do
      expect(book.author).to eq 'Longhorn'
    end

    it 'returns empty rental' do
      expect(book.rental).to be_empty
    end
  end

  context 'Book method test' do
    let(:person) { Person.new(28, name: 'test', parent_permission: false) }
    let(:rental) { Rental.new('2023-01-01', person, book) }

    it 'it add book rental' do
      book.add_rental('2023-01-01', person)
      expect(book.rental.length).to eq 1
    end

    it 'converts book attributes to hash' do
      @hash = {
        title: book.title,
        author: book.author
      }

      expect(book.as_json).to eq @hash
    end
  end
end
