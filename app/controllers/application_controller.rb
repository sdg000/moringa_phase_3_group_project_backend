class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #  READ

  get "/" do
    { message: "Welcome to your backend Application" }.to_json
  end

  # find all students
  get "/students" do 
    Student.all.to_json(include: :subjects)
  end

    #find all course
  get "/courses" do
    Course.all.to_json(include: :students)
  end
  

  # find a student / course / subjects by index_no:
  get "/students/:index_no" do 
    student = Student.find("#{params[:index_no]}")
    student.to_json(include: {course: {include: :subjects}})
  end

  # find all grades
  get "/grades" do 
    grades = Grade.all
    grades.to_json
  end

  #find INDIVIDUAL STUDENT-SUBJECT RESULT for 1 term.
  get "/students/:index_no/:academic_year/:term/:subject/grade" do 
    student_subjects = Student.find(params[:index_no]).subjects
    target = student_subjects.each.find do |item|
      item.subject_name.downcase == "#{params[:subject].downcase}"
    end
    subject_id = "#{target.id}"
    subject_id

    student = Student.find(params[:index_no])
    year_results = student.grades.where("academic_year is ?", "#{params[:academic_year]}")
    term_results = year_results.where("term is ?", "#{params[:term]}")
    
    subject_score = term_results.where("subject_id is ?", subject_id)
    subject_score.to_json

  end



  # find student(ALL SUBJECTS) grades for a term >>>> <GetStudentTermResults/>

  # get "/getstudentgrades/:index_no/:academic_year/:level/:term" do 
  get "/getstudentgrades/:index_no/:academic_year/:level/:term" do 

    student = Student.find("#{params[:index_no]}")
    all_grades = student.grades
    year_results = all_grades.where("academic_year = ?", "#{params[:academic_year]}")
    term_results = year_results.where("term = ?", "#{params[:term]}")
    level_results = term_results.where("level = ?", "#{params[:level]}")

    level_results.to_json(include: :subject)
    # final = student_grades.where("level is ?", "#{params[:level]}")
    # final.to_json


  end

  #find all studens from a particular level
  get "/studentslevel/:level" do 
    student = Student.where("level = ?", "#{params[:level]}")
    student.to_json
  end

  # find CLASS SUBJECT RESULTS for 1 term, 1 level     >>>>  <GetClassTermResults/>
  get "/class-grades/:course/:subject/:level/:term" do 

    courses = Course.all.each.find do |item|
      item.name.downcase == "#{params[:course].downcase}"
    end

    subject = courses.subjects.each.find do |item|
      item.subject_name.downcase == "#{params[:subject].downcase}"
    end

    level_grades = subject.grades.where("level is ?", params[:level]).where("term is ?", params[:term])
    level_grades.to_json(include: :subject)

  end



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




  delete "/deletestudents" do 
    students = Student.all.destroy_all
    students.to_json
  end

  delete "/deletegrades" do 
    grades = Grade.all.destroy_all
    grades.to_json

  end


  #CREATE

  #create a student

  post "/create-student" do 

    #INTERCEPT params[:course_id], transform course name to course_id for backend
    Course.all.each.find do |item| 
      if item.name.downcase == "#{params[:course_id].downcase}"
        params[:course_id] = "#{item.id}"
      end
    end


      
    new_student = Student.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      dob: params[:dob],
      date_admitted: params[:date_admitted],  
      gpa: params[:gpa],
      course_id: params[:course_id],
      index_no: params[:index_no],
      level: params[:level]
    )
    new_student.to_json
    # params[:id]
    
  end


  # grade single subject (student)

  

  post "/grade-subject" do 

    #INTERCEPT AND CHANGE PARAMETER: transform subject_name to subject_id to be used here

    student_subjects = Student.find(params[:index_no]).subjects
    student_subjects.all.each.find do |item| 
      if item.subject_name.downcase == "#{params[:subject_id].downcase}"
        params[:subject_id] = "#{item.id}"
      end
      # params[:course_id]
    end


    grade_subject = Grade.create(
      academic_year: params[:academic_year],
      term: params[:term],
      exams_score: params[:exams_score],
      subject_id: params[:subject_id],
      index_no: params[:index_no],
      level: params[:level]
    )
    grade_subject.to_json
  end

  


  #PATCH

#UPDATING GRADE

# STEPS: for frontend (fetch twice) refer to 
  # 1. send fetch request to  "/students/:index_no/:academic_year/:term/grades"
  # 2. iterate results (hash), find object matching (subject_name)
  # 3 if found, save id of object as grade_id 
  # 4 send pactch request to Grade class using grade_id for find.

  patch "/change-grade/:index_no/:academic_year/:level/:term/:subject" do 


    # student_grades = Student.find(params[:index_no]).grades 
    # year = student_grades.where("academic_year is ?", "#{params[:academic_year]}")
    # level = year.where("level is ?", "#{params[:level]}")
    # term = level.where("term is ?", "#{params[:term]}")
    # subject = term.each.find do |item|
    #   item.subject_name.downcase == "#{params[:subject].downcase}"
    # end
    # params[:id] = "#{subject.grade.id}"


    student_subjects = Student.find(params[:index_no]).subjects
    target = student_subjects.each.find do |item|
      item.subject_name.downcase == "#{params[:subject].downcase}"
    end
    # target.to_json

    subject_id = "#{target.id}"
    # subject_id

    student_grades = Student.find(params[:index_no]).grades 
    # student_grades.to_json
    grade1 = student_grades.where("academic_year is ?", "#{params[:academic_year]}").where("term is ?", "#{params[:term]}")
    # grade1.to_json
    # "#{ grade1.term}"
    # level = year.where("level is ?", "#{params[:level]}")
    # level.to_json
    # grade1.where("term is ?", "#{params[:term]}").to_json


    # params[:id] = "#{target_grade.id}"
    # "#{target_grade.id}"
    # target_grade.to_json

    # grade = Grade.find("#{target_grade.id}")

    grade1.update(
      academic_year: params[:academic_year],
      term: params[:term],
      exams_score: params[:exams_score],
      subject_id: params[:subject_id],
      index_no: params[:index_no],
      level: params[:level]
    )
    grade1.to_json
  end







#UPDATING STUDENT INFO

# update student:  not urgently required

end

  # define custom method to find individual courses and it's number of registered students
