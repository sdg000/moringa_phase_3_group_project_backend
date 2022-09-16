class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #  READ

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

  # find all grades
  get "/grades" do 
    grades = Grade.all
    grades.to_json
  end

  # find student grade 
  # (returns hash of specific student's grade 
  # iterate and find specific object matchng (academic year, term, subject)
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



  # DELETE

  # remove student
  delete ("/remove-student/:index_no") do 
    student = Student.find(params[:index_no])
    student.destroy
    student.to_json
  end

  # remove grade
  # STEPS: for frontend
  # 1. fetch grades of student using index_no
  # 2. iterate results (hash), find object matching;
  # -academic_year, term, subject_name
  # 3 if found, save id of object as grade_id 
  # 4 send delete request to Grade class using grade_id for find.

  delete "/remove-grade/:id" do 
    grade = Grade.find(params[:id])
    grade.destroy
    grade.to_json
  end

  # remove course:  not urgently required
  # remove subject: not urgently required



  #CREATE

  #create a student

  post "/create-student" do 
    new_student = Student.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      dob: params[:dob],
      hometown: params[:hometown],
      gpa: params[:gpa],
      course_id: params[:course_id],
      index_no: params[:index_no]
    )
    new_student.to_json
  end


  # grade single subject (student)

  # UNIQUE FEATURES FOR FRONTEND GRADE FILLING:

  # In index_no field : onChange, 
  # Call function to use {value} to fetch from Student_database with
  # index_no as parameter.  Use results to: find subjects_id
  
  # prefill {GRADE FORM}:
  #   -index_no : manually filled
  #   -academic_year : manually filled
  #   -term : manually filled
  #   -exams_score: manually filled
  #   -SUBJECT - select from options and auto create/save it's
  #     subject_id to be posted

  # HINT: use useEffect conditioned onvalue of forms

  post "/grade-subject" do 
    grade_subject = Grade.create(
      academic_year: params[:academic_year],
      term: params[:term],
      exams_score: params[:exams_score],
      subject_id: params[:subject_id],
      index_no: params[:index_no]
    )
    grade_subject.to_json
  end



  



  #UPDATE

#UPDATING GRADE

#UPDATING STUDENT INFO
end
