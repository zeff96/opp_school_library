require_relative '../decorator'
require_relative '../person'

describe Decorator do
  context 'it initializes' do
    before(:each) do
      @person = Person.new(22, name: 'maximillus', parent_permission: false)
      @decorator = Decorator.new(@person)
    end

    it 'returns correct name' do
      expect(@decorator.correct_name).to eq 'maximillus'
    end
  end
end
