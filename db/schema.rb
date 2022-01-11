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

ActiveRecord::Schema.define(version: 2022_01_09_194459) do

  create_table "documents", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "mortgagor_id"
    t.integer "document", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "month"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mortgagor_id"], name: "index_documents_on_mortgagor_id"
    t.index ["project_id"], name: "index_documents_on_project_id"
  end

  create_table "mortgagors", force: :cascade do |t|
    t.string "first_name", null: false
    t.integer "contract", default: 0, null: false
    t.integer "civil_status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "project_kind", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects_mortgagors", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "mortgagor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mortgagor_id"], name: "index_projects_mortgagors_on_mortgagor_id"
    t.index ["project_id"], name: "index_projects_mortgagors_on_project_id"
  end

  add_foreign_key "documents", "mortgagors"
  add_foreign_key "documents", "projects"
  add_foreign_key "projects_mortgagors", "mortgagors"
  add_foreign_key "projects_mortgagors", "projects"
end
