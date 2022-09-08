require "test_helper"
require "faker"

class ClassroomTest < ActiveSupport::TestCase
  test "Should not save without informations" do
    classroom = Classroom.new(name: '', city: '')
    assert_not classroom.save
  end

  test "Should save with a first_name and last_name" do
    classroom = Classroom.new(name: Faker::Educator.primary_school, city: Faker::Address.city)
    assert classroom.save
  end
end