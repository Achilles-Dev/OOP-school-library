require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(45, 'CS', 'Solomon')
  end

  context 'Create @teacher, an instance of class Teacher' do
    it 'takes three parameters and return a Teacher object' do
      expect(@teacher).to be_instance_of Teacher
    end
  end

  context 'Display specialization of default @techer' do
    it "should display 'CS' as @teachers's specialization" do
      expected_value = 'CS'
      expect(@teacher.specialization).to eq(expected_value)
    end
  end
end
