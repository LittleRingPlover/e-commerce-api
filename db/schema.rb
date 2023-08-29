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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_115741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "apartment"
    t.string "city"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id", null: false
    t.index ["session_id"], name: "index_carts_on_session_id"
  end

  create_table "carts_products", id: false, force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.index ["cart_id", "product_id"], name: "index_carts_products_on_cart_id_and_product_id"
    t.index ["product_id", "cart_id"], name: "index_carts_products_on_product_id_and_cart_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "discount_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "payment_id", null: false
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.index ["order_id", "product_id"], name: "index_orders_products_on_order_id_and_product_id"
    t.index ["product_id", "order_id"], name: "index_orders_products_on_product_id_and_order_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_method_id", null: false
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "discount_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["discount_id"], name: "index_products_on_discount_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "shipping_methods", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shipping_method_id", null: false
    t.bigint "order_id", null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_shippings_on_address_id"
    t.index ["order_id"], name: "index_shippings_on_order_id"
    t.index ["shipping_method_id"], name: "index_shippings_on_shipping_method_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "sessions"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "discounts"
  add_foreign_key "sessions", "users"
  add_foreign_key "shippings", "addresses"
  add_foreign_key "shippings", "orders"
  add_foreign_key "shippings", "shipping_methods"
  add_foreign_key "users", "addresses"
end
