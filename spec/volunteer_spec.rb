require 'spec_helper'

describe Volunteer do
  describe '#name' do
    it 'tells you the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson'})
      expect(test_volunteer.name).to(eq('Wes Anderson'))
    end
  end
end
