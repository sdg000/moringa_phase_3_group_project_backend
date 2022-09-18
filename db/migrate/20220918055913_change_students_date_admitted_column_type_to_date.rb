class ChangeStudentsDateAdmittedColumnTypeToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :students, :date_admitted, :date
  end
end
