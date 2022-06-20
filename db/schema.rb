# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_15_143005) do

  create_table "assessments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "purpose", null: false
    t.integer "weight", null: false
    t.integer "pain_hip_id", null: false
    t.integer "dysesthesia_hip_id", null: false
    t.integer "sensory_hip_id", null: false
    t.integer "strength_hip_flexion_id", null: false
    t.integer "strength_hip_extension_id", null: false
    t.integer "strength_hip_abduction_id", null: false
    t.integer "strength_hip_adduction_id", null: false
    t.integer "strength_hip_external_id", null: false
    t.integer "strength_hip_internal_id", null: false
    t.integer "range_hip_flexion_id", null: false
    t.integer "range_hip_extension_id", null: false
    t.integer "range_hip_abduction_id", null: false
    t.integer "range_hip_adduction_id", null: false
    t.integer "range_hip_external_id", null: false
    t.integer "range_hip_internal_id", null: false
    t.bigint "user_id", null: false
    t.bigint "chart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chart_id"], name: "index_assessments_on_chart_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "chart_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chart_id"], name: "index_chart_users_on_chart_id"
    t.index ["user_id"], name: "index_chart_users_on_user_id"
  end

  create_table "charts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "lastname_kata", null: false
    t.string "firstname_kata", null: false
    t.date "birthday", null: false
    t.text "profile", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assessments", "charts"
  add_foreign_key "assessments", "users"
  add_foreign_key "chart_users", "charts"
  add_foreign_key "chart_users", "users"
end
