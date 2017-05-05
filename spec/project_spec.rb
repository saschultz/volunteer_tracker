require 'spec_helper'

describe Project do
  describe '#name' do
    it 'tells you the name of the project' do
      test_project = Project.new({:name => 'Save the Earth'})
      expect(test_project.name).to(eq('Save the Earth'))
    end
  end

  describe '#id' do
    it 'returns you the id of the project' do
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

  describe '.find' do
   it 'finds a project based off an id' do
      test_project1 = Project.new({:name => 'Clean our Oceans', :id => nil})
      test_project1.save
      test_project2 = Project.new({:name => 'Save the Great Barrier Reef', :id => nil})
      test_project2.save
      expect(Project.find(test_project2.id)).to(eq(test_project2))
   end
 end

 describe '#update' do
   it 'will update the name of the project in the database' do
      test_project = Project.new({:name => 'Clean our Ocean', :id => nil})
      test_project.save
      test_project.update({:name => "Clean our Oceans"})
      expect(test_project.name).to(eq("Clean our Oceans"))
   end
 end

 describe '#delete' do
    it 'lets you delete a project from the database' do
      project = Project.new({:name => 'Clean our Oceans', :id => nil})
      project.save
      project2 = Project.new({:name => 'Save the Great Barrier Reef', :id => nil})
      project2.save
      project.delete
      expect(Project.all).to(eq([project2]))
    end
  end

  describe '#volunteers' do
    it 'will add volunteer to a project' do
      project = Project.new({:name => 'Save the Great Barrier Reef', :id => nil})
      project.save
      volunteer1 = Volunteer.new({:name => 'Wes Anderson', :project_id => project.id, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Tim Burton', :project_id => project.id, :id => nil})
      volunteer2.save
      expect(project.volunteers).to eq([volunteer1, volunteer2])
    end
  end


end
