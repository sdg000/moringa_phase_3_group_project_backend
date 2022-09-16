class Subject < ActiveRecord::Base
    belongs_to :course
    # belongs_to :student
    has_many :grades


    #ADD LIBRARY COLUMN


end