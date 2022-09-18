class Course < ActiveRecord::Base
    has_many :students
    has_many :subjects
    has_many :grades
    # has_many :grades, through: :subjects

end