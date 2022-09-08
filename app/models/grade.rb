class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :classroom
  enum grade_type: %i[CE1 CE2 CM1 CM2]
  before_validation :set_default_grade_type
  accepts_nested_attributes_for :student, :classroom

  private

  def set_default_grade_type
    self.grade_type ||= :CE1
  end
end