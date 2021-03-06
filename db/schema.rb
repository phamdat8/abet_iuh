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

ActiveRecord::Schema.define(version: 2022_05_22_071746) do

  create_table "abet_levels", force: :cascade do |t|
    t.string "type"
    t.string "value"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_abet_levels_on_subject_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "learning_outcomes", force: :cascade do |t|
    t.integer "subject_id"
    t.string "name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "d_c"
    t.string "c_b"
    t.string "b_a"
    t.string "abet_score_type"
    t.string "a_content"
    t.string "b_content"
    t.string "c_content"
    t.string "d_content"
    t.index ["subject_id"], name: "index_learning_outcomes_on_subject_id"
  end

  create_table "lo_types", force: :cascade do |t|
    t.integer "learning_outcome_id"
    t.string "name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_outcome_id"], name: "index_lo_types_on_learning_outcome_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "room_id"
    t.integer "user_id"
    t.boolean "owner", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_members_on_room_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
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

  create_table "pi_los", force: :cascade do |t|
    t.integer "pi_id"
    t.integer "learning_outcome_id"
    t.string "process"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_outcome_id"], name: "index_pi_los_on_learning_outcome_id"
    t.index ["pi_id"], name: "index_pi_los_on_pi_id"
  end

  create_table "pis", force: :cascade do |t|
    t.string "content"
    t.integer "so_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["so_id"], name: "index_pis_on_so_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "score_boards", force: :cascade do |t|
    t.integer "student_id"
    t.float "score"
    t.integer "score_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["score_type_id"], name: "index_score_boards_on_score_type_id"
    t.index ["student_id"], name: "index_score_boards_on_student_id"
  end

  create_table "score_types", force: :cascade do |t|
    t.string "name"
    t.integer "importance"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_score_types_on_subject_id"
  end

  create_table "section_classes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
    t.integer "semester_id"
    t.index ["semester_id"], name: "index_section_classes_on_semester_id"
    t.index ["subject_id"], name: "index_section_classes_on_subject_id"
  end

  create_table "section_classes_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "section_class_id", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sos", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_sos_on_semester_id"
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
    t.string "d_c"
    t.string "c_b"
    t.string "b_a"
    t.string "abet_score_type"
    t.text "content"
    t.integer "user_id"
    t.index ["user_id"], name: "index_subjects_on_user_id"
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
