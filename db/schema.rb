# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161007070543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_employees", force: :cascade do |t|
    t.integer  "official_group_id"
    t.integer  "staff_of_id"
    t.string   "staff_of_type"
    t.integer  "unit_id"
    t.string   "updated_by"
    t.decimal  "quantity",          precision: 5, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "period_id"
  end

  add_index "assigned_employees", ["official_group_id"], name: "index_assigned_employees_on_official_group_id", using: :btree
  add_index "assigned_employees", ["period_id"], name: "index_assigned_employees_on_period_id", using: :btree
  add_index "assigned_employees", ["unit_id"], name: "index_assigned_employees_on_unit_id", using: :btree

  create_table "entry_indicator_sources", force: :cascade do |t|
    t.integer  "entry_indicator_id"
    t.integer  "source_id"
    t.decimal  "amount",             precision: 12, scale: 2
    t.string   "uupdates_by"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "entry_indicator_sources", ["entry_indicator_id"], name: "index_entry_indicator_sources_on_entry_indicator_id", using: :btree
  add_index "entry_indicator_sources", ["source_id"], name: "index_entry_indicator_sources_on_source_id", using: :btree

  create_table "entry_indicators", force: :cascade do |t|
    t.integer  "unit_id"
    t.integer  "indicator_metric_id"
    t.integer  "indicator_source_id"
    t.text     "specifications"
    t.integer  "amount"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "entry_indicators", ["indicator_metric_id"], name: "index_entry_indicators_on_indicator_metric_id", using: :btree
  add_index "entry_indicators", ["indicator_source_id"], name: "index_entry_indicators_on_indicator_source_id", using: :btree
  add_index "entry_indicators", ["unit_id"], name: "index_entry_indicators_on_unit_id", using: :btree

  create_table "indicator_groups", force: :cascade do |t|
    t.string   "updated_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "item_id"
    t.integer  "order"
    t.integer  "sub_process_id"
  end

  add_index "indicator_groups", ["item_id"], name: "index_indicator_groups_on_item_id", using: :btree
  add_index "indicator_groups", ["sub_process_id"], name: "index_indicator_groups_on_sub_process_id", using: :btree

  create_table "indicator_metrics", force: :cascade do |t|
    t.integer "indicator_id"
    t.integer "metric_id"
  end

  add_index "indicator_metrics", ["indicator_id"], name: "index_indicator_metrics_on_indicator_id", using: :btree
  add_index "indicator_metrics", ["metric_id"], name: "index_indicator_metrics_on_metric_id", using: :btree

  create_table "indicator_sources", force: :cascade do |t|
    t.integer "indicator_id"
    t.integer "source_id"
  end

  add_index "indicator_sources", ["indicator_id"], name: "index_indicator_sources_on_indicator_id", using: :btree
  add_index "indicator_sources", ["source_id"], name: "index_indicator_sources_on_source_id", using: :btree

  create_table "indicators", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "item_id"
    t.integer  "order"
    t.string   "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "indicators", ["item_id"], name: "index_indicators_on_item_id", using: :btree
  add_index "indicators", ["task_id"], name: "index_indicators_on_task_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "item_type"
    t.string   "description"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "main_processes", force: :cascade do |t|
    t.integer  "period_id"
    t.integer  "item_id"
    t.integer  "order"
    t.string   "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "main_processes", ["item_id"], name: "index_main_processes_on_item_id", using: :btree
  add_index "main_processes", ["period_id"], name: "index_main_processes_on_period_id", using: :btree

  create_table "manager_organization_types", force: :cascade do |t|
    t.integer "user_id"
    t.integer "organization_type_id"
  end

  add_index "manager_organization_types", ["organization_type_id"], name: "index_manager_organization_types_on_organization_type_id", using: :btree
  add_index "manager_organization_types", ["user_id"], name: "index_manager_organization_types_on_user_id", using: :btree

  create_table "metrics", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "in_out"
    t.string   "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "metrics", ["item_id"], name: "index_metrics_on_item_id", using: :btree

  create_table "official_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organization_types", force: :cascade do |t|
    t.string   "acronym"
    t.string   "description"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "organization_type_id"
    t.string   "description"
    t.string   "short_description"
    t.string   "sap_id"
    t.integer  "order"
    t.string   "updated_by"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "organizations", ["organization_type_id"], name: "index_organizations_on_organization_type_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.integer  "organization_type_id"
    t.string   "description",          limit: 100
    t.date     "started_at"
    t.date     "ended_at"
    t.date     "opened_at"
    t.date     "closed_at"
    t.string   "updated_by"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "periods", ["description"], name: "index_periods_on_description", using: :btree
  add_index "periods", ["organization_type_id"], name: "index_periods_on_organization_type_id", using: :btree
  add_index "periods", ["started_at"], name: "index_periods_on_started_at", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
  end

  create_table "sources", force: :cascade do |t|
    t.integer  "item_id"
    t.boolean  "fixed"
    t.boolean  "has_specification"
    t.integer  "order"
    t.string   "updated_by"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sources", ["item_id"], name: "index_sources_on_item_id", using: :btree

  create_table "sub_processes", force: :cascade do |t|
    t.integer  "main_process_id"
    t.integer  "unit_type_id"
    t.integer  "item_id"
    t.string   "order"
    t.string   "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "sub_processes", ["item_id"], name: "index_sub_processes_on_item_id", using: :btree
  add_index "sub_processes", ["main_process_id"], name: "index_sub_processes_on_main_process_id", using: :btree
  add_index "sub_processes", ["unit_type_id"], name: "index_sub_processes_on_unit_type_id", using: :btree

  create_table "summary_process_details", force: :cascade do |t|
    t.integer  "summary_process_id"
    t.integer  "unit_id"
    t.integer  "sub_process_id"
    t.decimal  "amount",             precision: 12, scale: 2
    t.decimal  "A1",                 precision: 5,  scale: 2
    t.decimal  "A2",                 precision: 5,  scale: 2
    t.decimal  "C1",                 precision: 5,  scale: 2
    t.decimal  "C2",                 precision: 5,  scale: 2
    t.decimal  "E",                  precision: 5,  scale: 2
    t.string   "updated_by"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "summary_process_details", ["sub_process_id"], name: "index_summary_process_details_on_sub_process_id", using: :btree
  add_index "summary_process_details", ["summary_process_id"], name: "index_summary_process_details_on_summary_process_id", using: :btree
  add_index "summary_process_details", ["unit_id"], name: "index_summary_process_details_on_unit_id", using: :btree

  create_table "summary_process_indicators", force: :cascade do |t|
    t.integer  "summary_process_id"
    t.string   "indicator"
    t.string   "metric"
    t.string   "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "summary_process_indicators", ["summary_process_id"], name: "index_summary_process_indicators_on_summary_process_id", using: :btree

  create_table "summary_processes", force: :cascade do |t|
    t.integer  "process_id"
    t.string   "process_type"
    t.string   "process_description"
    t.integer  "period_id"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "sub_process_id"
    t.integer  "item_id"
    t.integer  "order"
    t.string   "updated_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tasks", ["item_id"], name: "index_tasks_on_item_id", using: :btree
  add_index "tasks", ["sub_process_id"], name: "index_tasks_on_sub_process_id", using: :btree

  create_table "total_indicators", force: :cascade do |t|
    t.integer  "indicator_metric_id"
    t.integer  "indicator_group_id"
    t.string   "indicator_type"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "total_indicators", ["indicator_group_id"], name: "index_total_indicators_on_indicator_group_id", using: :btree
  add_index "total_indicators", ["indicator_metric_id"], name: "index_total_indicators_on_indicator_metric_id", using: :btree

  create_table "unit_types", force: :cascade do |t|
    t.integer  "organization_type_id"
    t.string   "description"
    t.string   "updated_by"
    t.integer  "order"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "unit_types", ["organization_type_id"], name: "index_unit_types_on_organization_type_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "unit_type_id"
    t.integer  "organization_id"
    t.string   "description_sap"
    t.integer  "sap_id"
    t.integer  "order"
    t.string   "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "units", ["organization_id"], name: "index_units_on_organization_id", using: :btree
  add_index "units", ["unit_type_id"], name: "index_units_on_unit_type_id", using: :btree

  create_table "user_organizations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "organization_id"
  end

  add_index "user_organizations", ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
  add_index "user_organizations", ["user_id"], name: "index_user_organizations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.integer  "uweb_id"
    t.string   "name"
    t.string   "surname"
    t.string   "second_surname"
    t.string   "document_number"
    t.string   "document_type"
    t.integer  "pernr"
    t.string   "phone"
    t.string   "official_position"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "role"
  end

  add_foreign_key "assigned_employees", "official_groups"
  add_foreign_key "assigned_employees", "periods"
  add_foreign_key "assigned_employees", "units"
  add_foreign_key "entry_indicator_sources", "entry_indicators"
  add_foreign_key "entry_indicator_sources", "sources"
  add_foreign_key "entry_indicators", "indicator_metrics"
  add_foreign_key "entry_indicators", "indicator_sources"
  add_foreign_key "entry_indicators", "units"
  add_foreign_key "indicator_groups", "items"
  add_foreign_key "indicator_groups", "sub_processes"
  add_foreign_key "indicator_metrics", "indicators"
  add_foreign_key "indicator_metrics", "metrics"
  add_foreign_key "indicator_sources", "indicators"
  add_foreign_key "indicator_sources", "sources"
  add_foreign_key "indicators", "items"
  add_foreign_key "indicators", "tasks"
  add_foreign_key "main_processes", "items"
  add_foreign_key "main_processes", "periods"
  add_foreign_key "manager_organization_types", "organization_types"
  add_foreign_key "manager_organization_types", "users"
  add_foreign_key "metrics", "items"
  add_foreign_key "organizations", "organization_types"
  add_foreign_key "periods", "organization_types"
  add_foreign_key "sources", "items"
  add_foreign_key "sub_processes", "items"
  add_foreign_key "sub_processes", "main_processes"
  add_foreign_key "sub_processes", "unit_types"
  add_foreign_key "summary_process_details", "sub_processes"
  add_foreign_key "summary_process_details", "summary_processes"
  add_foreign_key "summary_process_details", "units"
  add_foreign_key "summary_process_indicators", "summary_processes"
  add_foreign_key "tasks", "items"
  add_foreign_key "tasks", "sub_processes"
  add_foreign_key "total_indicators", "indicator_groups"
  add_foreign_key "total_indicators", "indicator_metrics"
  add_foreign_key "unit_types", "organization_types"
  add_foreign_key "units", "organizations"
  add_foreign_key "units", "unit_types"
  add_foreign_key "user_organizations", "organizations"
  add_foreign_key "user_organizations", "users"
end
