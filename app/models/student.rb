class Student < ApplicationRecord
  has_many :grades
  has_many :classrooms, through: :grades
  validates :first_name, :last_name, presence: true
end