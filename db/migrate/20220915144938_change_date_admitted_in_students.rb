class ChangeDateAdmittedInStudents < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :date_admitted, :index_no
  end
end
