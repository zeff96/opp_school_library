require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  context 'before initialize' do
    before(:each) do
      @person = Person.new(22, name: 'maximillus', parent_permission: false)
      @capitalize = CapitalizeDecorator.new(@person)
    end

    it 'capitalizes \person\'s name' do
      expect(@capitalize.correct_name).to eq 'Maximillus'
    end
  end
end
