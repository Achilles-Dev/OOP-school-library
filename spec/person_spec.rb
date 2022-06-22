require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(32)
  end

  context 'Create @person, an instance of class Person' do
    it 'takes one parameters and return a Person object' do
      expect(@person).to be_instance_of Person
    end
  end

  context 'Display name of default @person' do
    it "should display 'Unknown' as @person's name" do
      expected_value = 'Unknown'
      expect(@person.name).to eq(expected_value)
    end
  end
end
