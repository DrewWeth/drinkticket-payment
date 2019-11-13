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

ActiveRecord::Schema.define(version: 2019_11_12_235929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.float "price"
    t.string "picture_url"
    t.integer "group_id"
    t.integer "changed_by_user_id"
    t.boolean "listed", default: false
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items_receipts", id: false, force: :cascade do |t|
    t.bigint "receipt_id", null: false
    t.bigint "item_id", null: false
  end

  create_table "items_transactions", id: false, force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.bigint "item_id", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "user_id"
    t.string "status"
    t.string "user_email"
    t.float "amount"
    t.string "payer_id"
    t.string "pay_source"
    t.string "pay_source_status"
    t.json "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id"
    t.string "status"
    t.string "user_email"
    t.float "amount"
    t.string "payer_id"
    t.string "pay_source"
    t.string "pay_source_status"
    t.json "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
