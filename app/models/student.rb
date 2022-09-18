class Student < ActiveRecord::Base
    self.primary_key = "index_no"
    has_one :course 
    belongs_to :course
    has_many :subjects, through: :course
    has_many :grades
    has_many :grades, through: :subjects


    # CORE_SUBJECTS = ["English", "Mathematics", "Science", "Social Studies"]

    # def initialize(first_name, last_name, dob, hometown, date_admitted, gpa)
    #     @first_name = name
    #     @last_name = last_name
    #     @dob = dob
    #     @hometown = hometown
    #     @date_admitted = date_admitted
    #     @gpa = gpa
    # end

    def grade
        # "#{self.first_name} #{self.last_name}"
        self.subjects
    end


    # find specific term subject_grade for student.
    def self.find_grade(index_no, academic_year, subject, term)

 
        #0 Find Student
        student = self.find_by(index_no: index_no)

        #1. Narrow down  student's grade to a specific academic year
        year_grades = student.grades.where("academic_year is ?", academic_year)

        #2. Narrow down  student's grade to a specific term in year
        term_grades = year_grades.where("term is ?", term)

        #3 return grade for specific subject using subject_name as search parameter to find target_subject's subject_id 
        result = term_grades.each.find do |item|
            item.subject.subject_name.downcase == subject.downcase
        end

        if result
            subject_id = result.subject_id
                    subject_score = term_grades.where("subject_id is ? ", subject_id).first
        subject_score.exams_score

        else
            "no match found"
        end        
    end
end