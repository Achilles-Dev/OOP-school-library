require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(32, )

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

  context 'Capitalizes name of @person' do
    it "should display capitalize name of @person" do
      @person.name = 'MAXImilianus'
      capitalizedPerson = CapitalizeDecorator.new(@person)
      corrected_name = capitalizedPerson.correct_name
      expected_value = 'Maximilianus'
      expect(corrected_name).to eq(expected_value)
    end
  end

  context 'Trims capitalized name of @person' do
    it "should trim the capitalized name of @person" do
      @person.name = 'MAXImilianus'
      capitalizedPerson = CapitalizeDecorator.new(@person)
      capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
      corrected_name = capitalizedTrimmedPerson.correct_name
      expected_value = 'Maximilian'
      expect(corrected_name).to eq(expected_value)
    end
  end
end
