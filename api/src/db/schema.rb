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

ActiveRecord::Schema.define(version: 2019_12_04_154333) do

  create_table "actor_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "actor_id"
    t.string "image_path"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["actor_id", "image_path"], name: "index_actor_images_on_actor_id_and_image_path", unique: true
    t.index ["actor_id"], name: "index_actor_images_on_actor_id"
  end

  create_table "actors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "brothel_id"
    t.string "service_id"
    t.string "girl_id"
    t.string "name"
    t.integer "age"
    t.integer "tall"
    t.integer "bust"
    t.string "cup"
    t.integer "waist"
    t.string "hip"
    t.string "actor_page_url"
    t.boolean "is_delete"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["brothel_id"], name: "index_actors_on_brothel_id"
    t.index ["name", "brothel_id"], name: "index_actors_on_name_and_brothel_id", unique: true
  end

  create_table "brothels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brothel_name"
    t.string "brothel_name_en"
    t.string "brothel_url"
    t.string "prefecture"
    t.string "prefecture_en"
    t.string "area_id"
    t.string "area_detail_id"
    t.string "brothel_type_id"
    t.string "brothel_type_name"
    t.boolean "is_delete", default: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["brothel_name", "prefecture"], name: "index_brothels_on_brothel_name_and_prefecture", unique: true
  end

  create_table "user_news_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "category", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_news_categories_on_user_id"
  end

  create_table "user_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "age"
    t.integer "gender", comment: "1:Male, 2:Female, 3:Others"
    t.string "location"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "enable_flag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_news_categories", "users"
  add_foreign_key "user_profiles", "users"
end
