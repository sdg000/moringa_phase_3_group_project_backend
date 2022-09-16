class RemoveCourseIdFromGrades < ActiveRecord::Migration[6.1]
  def change
    remove_column :grades, :course_id
  end
end
