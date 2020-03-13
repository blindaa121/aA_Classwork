class EnrolledCourse < ApplicationRecord
  belongs_to :user,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :User


end