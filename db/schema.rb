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

ActiveRecord::Schema.define(version: 2021_03_26_213712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id"
    t.index ["product_id", "category_id"], name: "index_categories_products_on_product_id_and_category_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "number"
    t.decimal "total"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "payment_method_id"
    t.string "state"
    t.decimal "total"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.decimal "price"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variations", force: :cascade do |t|
    t.integer "stock"
    t.string "sku"
    t.bigint "product_id"
    t.bigint "size_id"
    t.bigint "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_variations_on_color_id"
    t.index ["product_id"], name: "index_variations_on_product_id"
    t.index ["size_id"], name: "index_variations_on_size_id"
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "variations", "colors"
  add_foreign_key "variations", "products"
  add_foreign_key "variations", "sizes"
end
