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

ActiveRecord::Schema.define(version: 20170427054744) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "physician_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "record_type_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["physician_id"], name: "index_appointments_on_physician_id"
    t.index ["record_type_id"], name: "index_appointments_on_record_type_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "patient_id"
    t.boolean  "is_billed"
    t.datetime "billed_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["patient_id"], name: "index_invoices_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.date     "dob"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gender"
    t.string   "zip"
    t.string   "insurance"
    t.string   "group_num"
    t.string   "id_num"
    t.index ["gender"], name: "index_patients_on_gender"
  end

  create_table "presciptions", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "physician_id"
    t.string   "medication"
    t.integer  "quantity"
    t.datetime "issue_date"
    t.datetime "expiration_date"
    t.integer  "renew_count"
    t.boolean  "called_in"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["patient_id"], name: "index_presciptions_on_patient_id"
    t.index ["physician_id"], name: "index_presciptions_on_physician_id"
  end

  create_table "record_field_roles", force: :cascade do |t|
    t.integer  "record_field_id"
    t.integer  "role_id"
    t.integer  "access_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["access_type"], name: "index_record_field_roles_on_access_type"
    t.index ["record_field_id"], name: "index_record_field_roles_on_record_field_id"
    t.index ["role_id"], name: "index_record_field_roles_on_role_id"
  end

  create_table "record_fields", force: :cascade do |t|
    t.string   "name"
    t.text     "allowed_values"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "field_type"
    t.integer  "record_type_id"
    t.integer  "sort",           null: false
    t.index ["field_type"], name: "index_record_fields_on_field_type"
    t.index ["record_type_id"], name: "index_record_fields_on_record_type_id"
    t.index ["sort"], name: "index_record_fields_on_sort"
  end

  create_table "record_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "record_values", force: :cascade do |t|
    t.integer  "record_id"
    t.integer  "record_field_id"
    t.string   "value"
    t.boolean  "bool_value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "date_value"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["record_id"], name: "index_record_values_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "record_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "invoice_id"
    t.datetime "administered_at"
    t.index ["invoice_id"], name: "index_records_on_invoice_id"
    t.index ["patient_id"], name: "index_records_on_patient_id"
    t.index ["record_type_id"], name: "index_records_on_record_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_patients", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_user_patients_on_patient_id"
    t.index ["user_id"], name: "index_user_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.integer  "role_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.date     "dob"
    t.date     "hire_date"
    t.string   "zip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.integer  "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
