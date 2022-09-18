class ChangeHometownColumnInStudentsToDateAdmitted < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :hometown, :date_admitted
  end
end
