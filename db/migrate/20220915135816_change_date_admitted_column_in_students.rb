class ChangeDateAdmittedColumnInStudents < ActiveRecord::Migration[6.1]
  def change
    change_column :students, :date_admitted, :index_no
  end
end
