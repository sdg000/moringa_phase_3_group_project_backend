class AddLevelColumnToGrades < ActiveRecord::Migration[6.1]
  def change
    add_column :grades, :level, :integer
  end
end
