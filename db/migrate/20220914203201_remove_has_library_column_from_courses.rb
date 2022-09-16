class RemoveHasLibraryColumnFromCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :has_library
  end
end
