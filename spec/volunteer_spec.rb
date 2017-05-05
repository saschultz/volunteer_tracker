require 'spec_helper'

describe Volunteer do
  describe '#name' do
    it 'tells you the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson'})
      expect(test_volunteer.name).to(eq('Wes Anderson'))
    end
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe '#id' do
    it 'returns you the id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson', :project_id => 1, :id => nil})
      test_volunteer.save
      expect(test_volunteer.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe '#project_id' do
    it 'returns you the id of the project to that volunteer' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson', :id => nil, :project_id => 1})
      test_volunteer.save
      expect(test_volunteer.project_id).to(eq(1))
    end
  end

  describe '#==' do
    it 'is the same volunteer if they have the same name' do
      test_volunteer1 = Volunteer.new({:name => 'Wes Anderson', :id => nil})
      test_volunteer2 = Volunteer.new({:name => 'Wes Anderson', :id => nil})
      expect(test_volunteer1).to(eq(test_volunteer2))
    end
  end

  describe '#save' do
    it 'lets you save a volunteer to the array of volunteers' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson', :project_id => 1, :id => nil})
      test_volunteer.save
      expect(Volunteer.all).to(eq([test_volunteer]))
    end
  end

  describe '.find' do
   it 'finds a volunteer based off an id' do
      test_volunteer1 = Volunteer.new({:name => 'Wes Anderson', :project_id => 1, :id => nil})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => 'Tim Burton', :project_id => 2, :id => nil})
      test_volunteer2.save
      expect(Volunteer.find(test_volunteer2.id)).to(eq(test_volunteer2))
   end
 end

 describe '#update' do
   it 'will update the name of the volunteer in the database' do
      test_volunteer = Volunteer.new({:name => 'West Anderson', :project_id => 1, :id => nil})
      test_volunteer.save
      test_volunteer.update({:name => 'Wes Anderson'})
      expect(test_volunteer.name).to(eq('Wes Anderson'))
   end
 end

 describe '#delete' do
    it 'lets you delete a volunteer from the database' do
      volunteer = Volunteer.new({:name => 'Wes Anderson', :project_id => 1, :id => nil})
      volunteer.save
      volunteer2 = Volunteer.new({:name => 'Tim Burton', :project_id => 2, :id => nil})
      volunteer2.save
      volunteer.delete
      expect(Volunteer.all).to(eq([volunteer2]))
    end
  end
end
