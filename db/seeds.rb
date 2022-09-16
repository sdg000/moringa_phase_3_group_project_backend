puts "🌱 Seeding spices..."

#course instances

Course.destroy_all
business = Course.create(
    name: "Business",
)

science = Course.create(
    name: "Science",
)

gen_arts = Course.create(
    name: "Gen_Arts",
)


#student instances
Student.destroy_all
fred_tom = Student.create(
    first_name: "Fred",
    last_name: "Tom",
    dob: '2000-9-14',
    hometown: "Kumasi",
    course_id: business.id,
    index_no: 001
)

ama_pat = Student.create(
    first_name: "Ama",
    last_name: "Pat",
    dob: '2002/2/14',
    hometown: "Ho",
    course_id: science.id,
    index_no: 002
)

john_amewu = Student.create(
    first_name: "John",
    last_name: "Amewu",
    dob: '2005/3/11',
    hometown: "Takoradi",
    course_id: gen_arts.id,
    index_no: 003
)

mo_king = Student.create(
    first_name: "Mo",
    last_name: "King",
    dob: '2001/2/03',
    hometown: "Accra",
    course_id: gen_arts.id,
    index_no: 004
)



Subject.destroy_all

#subject instance   : ADD REMOVE LIBRARY COLUMN
elective_maths = Subject.create(
    subject_name: "Elective Mathematics",
    course_id: science.id
)

chemistry = Subject.create(
    subject_name: "Chemistry",
    course_id: science.id
)

biology = Subject.create(
    subject_name: "Biology",
    course_id: science.id
)

physics = Subject.create(
    subject_name: "Physics",
    course_id: science.id
)


economics = Subject.create(
    subject_name: "Economics",
    course_id: business.id
)

management = Subject.create(
    subject_name: "Management",
    course_id: business.id
)

accounting = Subject.create(
    subject_name: "Accounting",
    course_id: business.id
)

costing = Subject.create(
    subject_name: "Costing",
    course_id: business.id
)


government = Subject.create(
    subject_name: "Government",
    course_id: gen_arts.id
)

geography = Subject.create(
    subject_name: "Geography",
    course_id: gen_arts.id
)

crs = Subject.create(
    subject_name: "CRS",
    course_id: gen_arts.id
)

history = Subject.create(
    subject_name: "History",
    course_id: gen_arts.id
)


english = Subject.create(
    subject_name: "English",
    course_id: gen_arts.id
)

mathematics = Subject.create(
    subject_name: "Mathematics",
    course_id: gen_arts.id
)

social_studies = Subject.create(
    subject_name: "Social Studies",
    course_id: gen_arts.id
)

inter_science = Subject.create(
    subject_name: "Integrated Science",
    course_id: gen_arts.id
)

english = Subject.create(
    subject_name: "English",
    course_id: science.id
)

mathematics = Subject.create(
    subject_name: "Mathematics",
    course_id: science.id
)

social_studies = Subject.create(
    subject_name: "Social Studies",
    course_id: science.id
)

inter_science = Subject.create(
    subject_name: "Integrated Science",
    course_id: science.id
)


english = Subject.create(
    subject_name: "English",
    course_id: business.id
)

mathematics = Subject.create(
    subject_name: "Mathematics",
    course_id: business.id
)

social_studies = Subject.create(
    subject_name: "Social Studies",
    course_id: business.id
)

inter_science = Subject.create(
    subject_name: "Integrated Science",
    course_id: business.id
)

#creating grade
Grade.destroy_all
one = Student.first
one_subject1 = Student.first.subjects.first
Grade.create(academic_year: '2022-23', term: 1, exams_score: 80, subject_id: one_subject1.id, index_no: one.index_no)

two = Student.second
second_subject = two.subjects.second
Grade.create(academic_year: '2019-20', term: 1, exams_score: 84, subject_id: second_subject.id, index_no: two.index_no)


three = Student.third
third_subject = three.subjects.third
Grade.create(academic_year: '2019-20', term: 2, exams_score: 84, subject_id: third_subject.id, index_no: three.index_no)

fourth_subject = three.subjects.fourth
Grade.create(academic_year: '2019-20', term: 1, exams_score: 60, subject_id: fourth_subject.id, index_no: three.index_no)

subject = three.subjects.first
Grade.create(academic_year: '2021-22', term: 2, exams_score: 60, subject_id: subject.id, index_no: three.index_no)

subject5 = three.subjects.fifth
Grade.create(academic_year: '2021-22', term: 3, exams_score: 50, subject_id: subject5.id, index_no: three.index_no)

subject7 = Student.third.subjects.second
Grade.create(academic_year: '2021-22', term: 1, exams_score: 20, subject_id: subject7.id, index_no: three.index_no)

subject8 = Student.third.subjects.last
Grade.create(academic_year: '2019-20', term: 2, exams_score: 90, subject_id: subject8.id, index_no: three.index_no)



puts "✅ Done seeding!"
