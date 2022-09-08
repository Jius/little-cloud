require "test_helper"
require 'faker'

class StudentTest < ActiveSupport::TestCase
  test "Should not save without informations" do
    student = Student.new(first_name: '', last_name: '')
    assert_not student.save
  end

  test "Should save with a first_name and last_name" do
    student = Student.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    assert student.save
  end
end