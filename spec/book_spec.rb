require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  context 'Create @book, an instance of class Book ' do
    it 'takes two parameters and return a Book object' do
      expect(@book).to be_instance_of Book
    end
  end

  context 'Return value of book author'
  it 'returns the correct author' do
    expected_value = 'Author'
    expect(@book.author).to eq(expected_value)
  end
end
