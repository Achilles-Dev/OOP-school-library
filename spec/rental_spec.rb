require 'spec_helper'

describe Rental do
  before :all do
    @book = Book.new('tests', 'SOB')
    @student = Student.new(21, 'Grade 5', 'Spec', 'Y')
  end

  before :each do
    @rental = Rental.new('2022-02-17', @book, @student)
  end

  context 'Create @rental, an instance of class Rental ' do
    it 'takes three parameters and return a Rental object' do
      expect(@rental).to be_instance_of Rental
    end
  end

  context 'Return title of book rented out'
  it "returns the title 'tests'" do
    expected_value = 'tests'
    expect(@rental.book.title).to eq(expected_value)
  end
end
