class CreateCreateGrade < ActiveRecord::Migration[6.1]
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :course_id
      t.timestamp :academic_year
      t.integer :term
      t.integer :exams_score
    end
  end
end
