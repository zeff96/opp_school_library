require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  context 'before initialize' do
    let(:person) { Person.new(22, name: 'maximillus', parent_permission: false) }
    before(:each) do
      @trimmer = TrimmerDecorator.new(person)
    end
    it 'trims person\'s name' do
      expect(@trimmer.correct_name).to eq 'maximillus'
    end
  end
end
