require "test_helper"
require "faker"

class GradeTest < ActiveSupport::TestCase
  test "Should save without grade type" do
    grade = Grade.new(classroom_id: classrooms(:lespinasse).id, student_id: students(:jules).id)
    assert grade.save
  end

  test "Should save with grade type" do
    grade = Grade.new(grade_type: :CM2, classroom_id: classrooms(:lespinasse).id, student_id: students(:jules).id)
    assert grade.save
  end

  test "Should not save without classroom" do
    grade = Grade.new(classroom_id: '', student_id: students(:jules).id)
    assert_not grade.save
  end

  test "Should not save without student" do
    grade = Grade.new(classroom_id: classrooms(:lespinasse).id, student_id: '')
    assert_not grade.save
  end

  test "Should save grade with a creation of student (nested)" do
    grade = Grade.new(
      classroom_id: classrooms(:lespinasse).id,
      student_attributes: {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      }
    )
    assert grade.save
  end

  test "Should save grade with a creation of classroom (nested)" do
    grade = Grade.new(
      classroom_attributes: {
        name: Faker::Educator.primary_school,
        city: Faker::Address.city
      },
      student_id: students(:jules).id
    )
    assert grade.save
  end

  test "Should save grade with creations of classroom and student (nested)" do
    grade = Grade.new(
      classroom_attributes: {
        name: Faker::Educator.primary_school,
        city: Faker::Address.city
      },
      student_attributes: {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      }
    )
    assert grade.save
  end
end