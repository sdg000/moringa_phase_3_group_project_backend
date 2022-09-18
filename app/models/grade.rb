class Grade < ActiveRecord::Base
    belongs_to :subject
    belongs_to :student
    belongs_to :course


    # finding students grades
    # handled by Active Record #belongs_student
    # Example: Grade.last.student  => returns students whose grade was set last

    # find student grade by student_id
    def self.find_by_student_id(student_id)
        self.find_by(student_id: student_id)
    end

    # find specific subject grade for student\

    # find all grades from specific academic_year
    def self.find_grades_of_academic_year(academic_year)
        # self.where("academic_year is ?", academic_year")
        # self.find_by(academic_year: academic_year)
        self.all.map do |item|
            if item.academic_year == academic_year
                item
            end
        end
    end

end

