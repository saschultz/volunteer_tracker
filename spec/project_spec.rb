require 'spec_helper'

describe Project do
  describe '#name' do
    it 'tells you the name of the project' do
      test_project = Project.new({:name => 'Save the Earth'})
      expect(test_project.name).to(eq('Save the Earth'))
    end
  end

end
