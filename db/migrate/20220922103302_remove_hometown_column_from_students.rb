class RemoveHometownColumnFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :hometown
  end
end
