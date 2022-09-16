class Course < ActiveRecord::Base
    has_many :students
    has_many :subjects
    # has_many :students, through: :subjects

end