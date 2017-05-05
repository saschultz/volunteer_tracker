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
      test_volunteer = Volunteer.new({:name => 'Wes Anderson', :id => nil})
      test_volunteer.save
      expect(test_volunteer.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe '#project_id' do
    it 'returns you the id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson', :id => nil, :project_id => 1})
      test_volunteer.save
      expect(test_volunteer.project_id).to(eq(1))
    end
  end

  describe '#save' do
    it 'lets you save a volunteer to the database' do
      test_volunteer = Volunteer.new({:name => 'Wes Anderson', :id => nil, :project_id => 1})
      test_volunteer.save
      expect(Volunteer.all).to(eq([test_volunteer]))
    end
  end
end
