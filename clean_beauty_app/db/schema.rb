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

ActiveRecord::Schema.define(version: 20160826214045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.text     "name"
    t.text     "site_url"
    t.text     "hq_country"
    t.text     "hq_region"
    t.text     "hq_postal_code"
    t.integer  "year_founded"
    t.boolean  "is_vegan"
    t.boolean  "contains_vegan"
    t.boolean  "is_gluten_free"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.text     "name"
    t.text     "alternate_names"
    t.boolean  "is_animal_derived"
    t.boolean  "is_organic"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "product_ingredients", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "product_ingredients", ["ingredient_id"], name: "index_product_ingredients_on_ingredient_id", using: :btree
  add_index "product_ingredients", ["product_id"], name: "index_product_ingredients_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.text     "category"
    t.text     "application_type"
    t.decimal  "price"
    t.text     "currency"
    t.text     "size"
    t.text     "ingredientsGrouping"
    t.integer  "brand_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree

  add_foreign_key "product_ingredients", "ingredients"
  add_foreign_key "product_ingredients", "products"
end
