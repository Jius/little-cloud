class Classroom < ApplicationRecord
  validates :name, :city, presence: true
end