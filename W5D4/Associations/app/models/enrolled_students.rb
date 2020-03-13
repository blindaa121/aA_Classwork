class EnrolledStudent < ApplicationRecord 
  belongs_to :course,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Course
end