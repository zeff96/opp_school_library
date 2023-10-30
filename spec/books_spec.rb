require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('Mathematics', 'Longhorn') }
  context 'Validates presence of book attributes' do
    it 'returns book title' do
      expect(book.title).to eq 'Mathematics'
    end
  end
end
