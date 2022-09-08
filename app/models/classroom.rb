class Classroom < ApplicationRecord
  has_many :grades
  has_many :students, through: :grades
  validates :name, :city, presence: true
end