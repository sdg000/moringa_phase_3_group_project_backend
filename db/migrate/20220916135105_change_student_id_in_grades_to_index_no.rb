class ChangeStudentIdInGradesToIndexNo < ActiveRecord::Migration[6.1]
  def change
    rename_column :grades, :student_id, :index_no
  end
end
