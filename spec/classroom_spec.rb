require 'spec_helper'

describe Classroom do
  before :all do
    @student = Student.new(21, 'Unknown', 'Spec', 'Y')
  end

  before :each do
    @classroom = Classroom.new('Grade 5')
  end

  context 'Create @classroom, an instance of class Classroom ' do
    it 'takes one parameter and return a Classroom object' do
      expect(@classroom).to be_instance_of Classroom
    end
  end

  context 'Return students of classroom'
  it 'returns an empty array of students in classroom' do
    expected_value = []
    expect(@classroom.students).to eq(expected_value)
  end

  context 'Add student to classroom'
  it 'add one student to classroom ' do
    expected_value = 1
    @classroom.add_student(@student)
    expect(@classroom.students.length).to eq(expected_value)
  end

  context 'Return student\'s classroom label'
  it 'should return Grade 5' do
    expected_value = 'Grade 5'
    @classroom.add_student(@student)
    expect(@classroom.students[0].classroom.label).to eq(expected_value)
  end
end
