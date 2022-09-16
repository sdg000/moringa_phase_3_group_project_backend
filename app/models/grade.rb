class Grade < ActiveRecord::Base
    belongs_to :subject
    belongs_to :student


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

#creating grade
# Grade.destroy_all
# one = Student.first
# one_subject1 = Student.first.subjects.first
# Grade.create(academic_year: '2022-23', term: 1, exams_score: 80, subject_id: one_subject1.id, index_no: one.index_no)

# two = Student.second
# second_subject = two.subjects.second
# Grade.create(academic_year: '2019-20', term: 1, exams_score: 84, subject_id: second_subject.id, index_no: two.index_no)


# three = Student.third
# third_subject = three.subjects.third
# Grade.create(academic_year: '2019-20', term: 1, exams_score: 84, subject_id: third_subject.id, index_no: three.index_no)

# fourth_subject = three.subjects.fourth
# Grade.create(academic_year: '2019-20', term: 1, exams_score: 60, subject_id: fourth_subject.id, index_no: three.index_no)

# subject = three.subjects.first
# Grade.create(academic_year: '2021-22', term: 1, exams_score: 60, subject_id: subject.id, index_no: three.index_no)

# subject5 = three.subjects.fifth
# Grade.create(academic_year: '2021-22', term: 3, exams_score: 50, subject_id: subject5.id, index_no: three.index_no)

# subject7 = Student.third.subjects.second
# Grade.create(academic_year: '2021-22', term: 1, exams_score: 20, subject_id: subject7.id, index_no: three.index_no)

# subject8 = Student.third.subjects.last
# Grade.create(academic_year: '2019-20', term: 1, exams_score: 90, subject_id: subject8.id, index_no: three.index_no)
