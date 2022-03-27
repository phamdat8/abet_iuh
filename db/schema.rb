# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_27_141717) do

  create_table "admin_subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "original_classes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "section_class_id"
    t.string "misson"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_class_id"], name: "index_permissions_on_section_class_id"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "score_boards", force: :cascade do |t|
    t.integer "student_id"
    t.integer "score"
    t.integer "score_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_auto"
    t.index ["score_type_id"], name: "index_score_boards_on_score_type_id"
    t.index ["student_id"], name: "index_score_boards_on_student_id"
  end

  create_table "score_types", force: :cascade do |t|
    t.string "name"
    t.integer "importance"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_auto"
    t.string "code"
    t.string "calculate"
    t.index ["subject_id"], name: "index_score_types_on_subject_id"
  end

  create_table "section_classes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
    t.index ["subject_id"], name: "index_section_classes_on_subject_id"
  end

  create_table "section_classes_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "section_class_id", null: false
  end

  create_table "student_classes", force: :cascade do |t|
    t.integer "student_id"
    t.integer "section_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_class_id"], name: "index_student_classes_on_section_class_id"
    t.index ["student_id"], name: "index_student_classes_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "original_class_id"
    t.date "birthday"
    t.string "code"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_class_id"], name: "index_students_on_original_class_id"
  end

  create_table "subject_students", force: :cascade do |t|
    t.integer "student_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_subject_students_on_student_id"
    t.index ["subject_id"], name: "index_subject_students_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.string "code"
    t.string "phone"
    t.string "locale"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
