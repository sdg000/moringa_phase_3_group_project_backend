class AddLevelColumnToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :level, :integer
  end
end
