class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!!!" }.to_json
  end

  # find all students
  get "/students" do 
    Student.all.to_json
  end

  # find a student / course / subjects by index_no:
  get "/students/:index_no" do 
    student = Student.find(params[:index_no])
    student.to_json(include: {course: {include: :subjects}})
  end

  # find student grade 
  # (returns hash of specific student's grade to be extracted for purpose in frontend)

  get "/students/:index_no/grades" do 
    student = Student.find(params[:index_no])
    student.grades.to_json(include: :subject)

  end

  #find all course
  get "/courses" do
    Course.all.to_json(include: :students)
  end

  # define custom method to find individual courses and it's number of registered students
  





  
  # find student(all subjects) grades for an academic year/ term


  #POSTING GRADES
  # grade single subject (student)



  # grade multiple subjects (student)

end
