# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_18_062107) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
  end

  create_table "grades", force: :cascade do |t|
    t.text "academic_year"
    t.integer "term"
    t.integer "exams_score"
    t.integer "subject_id"
    t.integer "index_no"
    t.integer "level"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.date "date_admitted"
    t.integer "gpa"
    t.integer "course_id"
    t.integer "index_no"
    t.integer "level"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.integer "course_id"
  end

end
