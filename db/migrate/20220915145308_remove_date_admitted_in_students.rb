class RemoveDateAdmittedInStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :index_no
  end
end
