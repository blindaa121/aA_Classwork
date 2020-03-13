class Course < ApplicationRecord
  has_many :enrollments,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Enrollment

  has_many :enrolled_students,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :EnrolledStudent
end
