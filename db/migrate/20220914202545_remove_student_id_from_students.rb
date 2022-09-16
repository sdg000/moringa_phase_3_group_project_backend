class RemoveStudentIdFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :subjects, :student_id
  end
end
