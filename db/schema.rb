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

ActiveRecord::Schema[8.1].define(version: 2026_11_21_081254) do
  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "string"
    t.string "category"
    t.decimal "price"
    t.string "expiration_days"
    t.string "unit"
  end

  create_table "shop_products", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shop_products_on_product_id"
    t.index ["shop_id"], name: "index_shop_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "specialization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "warehouse_id", null: false
    t.index ["warehouse_id"], name: "index_shops_on_warehouse_id"
  end

  create_table "warehouse_products", force: :cascade do |t|
    t.integer "warehouse_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_warehouse_products_on_product_id"
    t.index ["warehouse_id"], name: "index_warehouse_products_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "address"
    t.string "specialization"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shop_products", "products"
  add_foreign_key "shop_products", "shops"
  add_foreign_key "shops", "warehouses"
  add_foreign_key "warehouse_products", "products"
  add_foreign_key "warehouse_products", "warehouses"
end
