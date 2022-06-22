require 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(21, 'Grade 5', 'Tobin', 'true')
  end

  context 'Create @student, an instance of class Student' do
    it 'takes four parameters and return a Student object' do
      expect(@student).to be_instance_of Student
    end
  end

  context 'Display age of default @student' do
    it "should display '21' as @students's age" do
      expected_value = 21
      expect(@student.age).to eq(expected_value)
    end
  end

  context 'Check whether student is of age to use service' do
    it 'should return true if student can use service' do
      @student.age = 13
      @student.parent_permission = nil
      can_use_services = @student.can_use_services?
      expect(can_use_services).to be_falsey
    end
  end
end
