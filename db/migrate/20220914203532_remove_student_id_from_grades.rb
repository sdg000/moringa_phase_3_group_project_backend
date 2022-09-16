class RemoveStudentIdFromGrades < ActiveRecord::Migration[6.1]
  def change
    remove_column :grades, :student_id
  end

end
