class AddUniqueIndexToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :index_no, :integer 
  end
end
