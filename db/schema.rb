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

ActiveRecord::Schema.define(version: 20170411224810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_experiments", force: :cascade do |t|
    t.integer  "classroom_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["classroom_id"], name: "index_assigned_experiments_on_classroom_id", using: :btree
    t.index ["experiment_id"], name: "index_assigned_experiments_on_experiment_id", using: :btree
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experiment_id"], name: "index_bookmarks_on_experiment_id", using: :btree
    t.index ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "code_name"
    t.string   "password_digest"
    t.integer  "user_id"
    t.integer  "institution_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["institution_id"], name: "index_classrooms_on_institution_id", using: :btree
    t.index ["user_id"], name: "index_classrooms_on_user_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "experiments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "approved"
    t.index ["user_id"], name: "index_experiments_on_user_id", using: :btree
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "postal_code"
    t.string   "contact_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "materials", force: :cascade do |t|
    t.float    "quantity"
    t.string   "units"
    t.string   "name"
    t.integer  "experiment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experiment_id"], name: "index_materials_on_experiment_id", using: :btree
  end

  create_table "plots", force: :cascade do |t|
    t.integer  "experiment_id"
    t.string   "plot_type"
    t.string   "x",                          array: true
    t.string   "y",                          array: true
    t.string   "z",                          array: true
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experiment_id"], name: "index_plots_on_experiment_id", using: :btree
  end

  create_table "procedures", force: :cascade do |t|
    t.integer  "experiment_id"
    t.integer  "step"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experiment_id"], name: "index_procedures_on_experiment_id", using: :btree
  end

  create_table "scatter_data_sets", force: :cascade do |t|
    t.integer  "classroom_id"
    t.float    "x"
    t.float    "y"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "plot_id"
    t.index ["classroom_id"], name: "index_scatter_data_sets_on_classroom_id", using: :btree
    t.index ["plot_id"], name: "index_scatter_data_sets_on_plot_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.integer  "institution_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "approved"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["institution_id"], name: "index_users_on_institution_id", using: :btree
  end

  add_foreign_key "assigned_experiments", "classrooms"
  add_foreign_key "assigned_experiments", "experiments"
  add_foreign_key "bookmarks", "experiments"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "classrooms", "institutions"
  add_foreign_key "classrooms", "users"
  add_foreign_key "experiments", "users"
  add_foreign_key "materials", "experiments"
  add_foreign_key "plots", "experiments"
  add_foreign_key "procedures", "experiments"
  add_foreign_key "scatter_data_sets", "classrooms"
  add_foreign_key "taggings", "tags"
  add_foreign_key "users", "institutions"
end
