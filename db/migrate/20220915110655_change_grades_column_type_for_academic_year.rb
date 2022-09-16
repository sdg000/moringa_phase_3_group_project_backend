class ChangeGradesColumnTypeForAcademicYear < ActiveRecord::Migration[6.1]
  def change
    change_column :grades, :academic_year, :text
  end
end
