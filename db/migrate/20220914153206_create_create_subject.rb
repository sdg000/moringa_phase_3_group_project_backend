class CreateCreateSubject < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.integer :course_id
      t.integer :student_id
    end
  end
end
