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

ActiveRecord::Schema.define(version: 20140523064121) do

  create_table "admin_channels", force: true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "typo"
    t.string   "title"
    t.string   "short_title"
    t.string   "properties"
    t.string   "default_url"
    t.string   "tmp_index"
    t.string   "tmp_list"
    t.string   "tmp_detail"
    t.string   "keywords"
    t.string   "description"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_channels", ["short_title"], name: "index_admin_channels_on_short_title", unique: true, using: :btree
  add_index "admin_channels", ["title"], name: "index_admin_channels_on_title", unique: true, using: :btree
  add_index "admin_channels", ["user_id"], name: "index_admin_channels_on_user_id", using: :btree

  create_table "admin_comments", force: true do |t|
    t.string   "name"
    t.string   "mobile_phone"
    t.string   "tel_phone"
    t.string   "email"
    t.string   "qq"
    t.string   "address"
    t.string   "gender"
    t.date     "birth"
    t.string   "hobby"
    t.text     "content"
    t.text     "content2"
    t.text     "content3"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_keystores", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_keystores", ["key"], name: "index_admin_keystores_on_key", using: :btree

  create_table "admin_pages", force: true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.string   "title"
    t.string   "short_title"
    t.string   "properties"
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_pages", ["channel_id"], name: "index_admin_pages_on_channel_id", using: :btree
  add_index "admin_pages", ["short_title"], name: "index_admin_pages_on_short_title", using: :btree
  add_index "admin_pages", ["user_id"], name: "index_admin_pages_on_user_id", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "site_comments", force: true do |t|
    t.integer  "site_id"
    t.integer  "template_page_id"
    t.string   "name"
    t.string   "mobile_phone"
    t.string   "tel_phone"
    t.string   "email"
    t.string   "qq"
    t.string   "weixin"
    t.string   "address"
    t.string   "gender"
    t.date     "birth"
    t.string   "hobby"
    t.text     "content"
    t.text     "content2"
    t.text     "content3"
    t.string   "status"
    t.integer  "updated_by"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_comments", ["site_id"], name: "index_site_comments_on_site_id", using: :btree
  add_index "site_comments", ["template_page_id"], name: "index_site_comments_on_template_page_id", using: :btree

  create_table "site_images", force: true do |t|
    t.integer  "site_page_id"
    t.string   "file"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_images", ["site_page_id"], name: "index_site_images_on_site_page_id", using: :btree

  create_table "site_page_keystores", force: true do |t|
    t.integer  "site_page_id"
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_page_keystores", ["site_page_id", "key"], name: "index_site_page_keystores_on_site_page_id_and_key", unique: true, using: :btree
  add_index "site_page_keystores", ["site_page_id"], name: "index_site_page_keystores_on_site_page_id", using: :btree

  create_table "site_pages", force: true do |t|
    t.integer  "site_id"
    t.integer  "template_page_id"
    t.string   "short_title"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_pages", ["site_id", "short_title"], name: "index_site_pages_on_site_id_and_short_title", unique: true, using: :btree
  add_index "site_pages", ["site_id"], name: "index_site_pages_on_site_id", using: :btree
  add_index "site_pages", ["template_page_id"], name: "index_site_pages_on_template_page_id", using: :btree

  create_table "sites", force: true do |t|
    t.integer  "user_id"
    t.integer  "template_id"
    t.string   "short_title"
    t.string   "title"
    t.string   "description"
    t.string   "domain"
    t.string   "status"
    t.boolean  "is_published",    default: true
    t.boolean  "is_comment_show", default: true
    t.integer  "updated_by"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["short_title"], name: "index_sites_on_short_title", unique: true, using: :btree
  add_index "sites", ["template_id"], name: "index_sites_on_template_id", using: :btree
  add_index "sites", ["user_id"], name: "index_sites_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "template_cates", force: true do |t|
    t.string "title"
    t.string "description"
  end

  add_index "template_cates", ["title"], name: "index_template_cates_on_title", unique: true, using: :btree

  create_table "template_keystores", force: true do |t|
    t.string   "template_type", limit: 50, null: false
    t.integer  "template_id",              null: false
    t.string   "key",                      null: false
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "template_keystores", ["template_id", "key"], name: "index_template_keystores_on_template_id_and_key", unique: true, using: :btree
  add_index "template_keystores", ["template_id"], name: "index_template_keystores_on_template_id", using: :btree

  create_table "template_pages", force: true do |t|
    t.integer  "template_id"
    t.integer  "sort_id"
    t.string   "title"
    t.string   "demo_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "template_pages", ["template_id", "title"], name: "index_template_pages_on_template_id_and_title", unique: true, using: :btree
  add_index "template_pages", ["template_id"], name: "index_template_pages_on_template_id", using: :btree

  create_table "template_themes", force: true do |t|
    t.integer "template_id"
    t.string  "title"
    t.string  "css_url"
    t.string  "preview_images"
    t.string  "preview_url"
  end

  add_index "template_themes", ["template_id"], name: "index_template_themes_on_template_id", using: :btree

  create_table "templates", force: true do |t|
    t.integer  "cate_id"
    t.string   "property"
    t.string   "base_url"
    t.string   "title",       limit: 128
    t.string   "keywords"
    t.text     "description"
    t.string   "demo_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "templates", ["cate_id"], name: "index_templates_on_template_cate_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
