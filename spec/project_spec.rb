require 'spec_helper'

describe Project do
  describe '#name' do
    it 'tells you the name of the project' do
      test_project = Project.new({:name => 'Save the Earth'})
      expect(test_project.name).to(eq('Save the Earth'))
    end
  end

  describe '#id' do
    it 'tells you the id of the project' do
      test_project = Project.new({:name => 'Save the Earth', :id => nil})
      test_project.save
      expect(test_project.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe '#save' do
    it 'lets you save a project to the database' do
      test_project = Project.new({:name => 'Save the Earth', :id => nil})
      test_project.save
      expect(Project.all).to(eq([test_project]))
    end
  end

  describe '#==' do
    it 'is the same project if it has the same name' do
      test_project1 = Project.new({:name => 'Save the Earth', :id => nil})
      test_project2 = Project.new({:name => 'Save the Earth', :id => nil})
      expect(test_project1).to(eq(test_project2))
    end
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Project.all()).to(eq([]))
    end
  end


end
