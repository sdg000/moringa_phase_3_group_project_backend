class AddStudentIdColumnToGrades < ActiveRecord::Migration[6.1]
  def change
    add_column :grades, :student_id, :integer
  end
end
