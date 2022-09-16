class ChangeGradesAcademicYearColumnTypeToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :grades, :academic_year, :date
  end
end
