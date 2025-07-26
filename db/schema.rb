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

ActiveRecord::Schema[8.0].define(version: 2025_07_26_170044) do
  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.integer "capacity"
    t.decimal "price"
    t.string "category"
    t.integer "status"
    t.integer "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_activities_on_gym_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "gym_id", null: false
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_attendances_on_gym_id"
    t.index ["member_id"], name: "index_attendances_on_member_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "activity_id", null: false
    t.date "booking_date"
    t.time "start_time"
    t.time "end_time"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_bookings_on_activity_id"
    t.index ["member_id"], name: "index_bookings_on_member_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "serial_number"
    t.date "purchase_date"
    t.date "maintenance_date"
    t.integer "status"
    t.integer "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_equipment_on_gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "phone"
    t.string "email"
    t.text "hours"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "member_id", null: false
    t.decimal "total_amount"
    t.date "due_date"
    t.integer "status"
    t.string "invoice_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_number"], name: "index_invoices_on_invoice_number", unique: true
    t.index ["member_id"], name: "index_invoices_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "membership_plan_id", null: false
    t.integer "gym_id", null: false
    t.string "membership_number"
    t.date "join_date"
    t.date "expiry_date"
    t.integer "status"
    t.string "emergency_contact"
    t.string "emergency_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_members_on_gym_id"
    t.index ["membership_number"], name: "index_members_on_membership_number", unique: true
    t.index ["membership_plan_id"], name: "index_members_on_membership_plan_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "membership_histories", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "membership_plan_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "status"
    t.decimal "payment_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_membership_histories_on_member_id"
    t.index ["membership_plan_id"], name: "index_membership_histories_on_membership_plan_id"
  end

  create_table "membership_plans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "duration_months"
    t.text "features"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "member_id", null: false
    t.decimal "amount"
    t.string "payment_method"
    t.date "payment_date"
    t.integer "status"
    t.string "reference_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.json "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "staff_schedules", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "gym_id", null: false
    t.integer "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_staff_schedules_on_gym_id"
    t.index ["staff_id"], name: "index_staff_schedules_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "gym_id", null: false
    t.string "position"
    t.date "hire_date"
    t.decimal "salary"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_staffs_on_gym_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.date "date_of_birth"
    t.integer "status"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "gyms"
  add_foreign_key "attendances", "gyms"
  add_foreign_key "attendances", "members"
  add_foreign_key "bookings", "activities"
  add_foreign_key "bookings", "members"
  add_foreign_key "equipment", "gyms"
  add_foreign_key "invoices", "members"
  add_foreign_key "members", "gyms"
  add_foreign_key "members", "membership_plans"
  add_foreign_key "members", "users"
  add_foreign_key "membership_histories", "members"
  add_foreign_key "membership_histories", "membership_plans"
  add_foreign_key "payments", "members"
  add_foreign_key "staff_schedules", "gyms"
  add_foreign_key "staff_schedules", "staffs"
  add_foreign_key "staffs", "gyms"
  add_foreign_key "staffs", "users"
end
