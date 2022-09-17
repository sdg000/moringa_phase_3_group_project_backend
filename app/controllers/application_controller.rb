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

  #find student grade for a subject.
  # find student grade (filter params: index_no, academic_year, term)
  # (returns hash of specific student's all subject grades for a specific term)
  # In frontend, iterate and find specific object matchng ( subject)

  get "/students/:index_no/:academic_year/:term/:subject/grades" do 
    search_subject = "#{params[:subject]}"
    search_subject = search_subject.to_s

    student_subjects = Student.find(params[:index_no]).subjects
    target = student_subjects.each.find do |item|
      item.subject_name.downcase == search_subject.downcase
    end
    subject_id = "#{target.id}"



    student = Student.find(params[:index_no])
    year_results = student.grades.where("academic_year is ?", "#{params[:academic_year]}")
    term_results = year_results.where("term is ?", "#{params[:term]}")
    
    subject_score = term_results.where("subject_id is ?", subject_id).to_json

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
  # 1. send fetch request to  "/students/:index_no/:academic_year/:term/grades"
  # 2. iterate results (hash), find object matching (subject_name)
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
  #   -term : select from options
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

# get "/findme/:name1/:name2" do
#   "hello #{params[:name1]} #{params[:name2]}"
# end

  


  #PATCH

#UPDATING GRADE

# STEPS: for frontend
  # 1. send fetch request to  "/students/:index_no/:academic_year/:term/grades"
  # 2. iterate results (hash), find object matching (subject_name)
  # 3 if found, save id of object as grade_id 
  # 4 send pactch request to Grade class using grade_id for find.

  patch "/change-student-grade/:id" do 
    grade = Grade.find(params[:id])
    grade.update(
      academic_year: params[:academic_year],
      term: params[:term],
      exams_score: params[:exams_score],
      subject_id: params[:subject_id],
      index_no: params[:index_no]
    )
    grade.to_json
  end







#UPDATING STUDENT INFO

# update student:  not urgently required

end
