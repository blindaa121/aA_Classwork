class CreateEnrolledCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolled_courses do |t|
      t.integer :course_id
      t.integer :student_id
    end
  end
end
