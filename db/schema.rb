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

ActiveRecord::Schema.define(version: 20150714160241) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.boolean  "highlight"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.integer  "parent_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["cached_votes_down"], name: "index_comments_on_cached_votes_down"
  add_index "comments", ["cached_votes_score"], name: "index_comments_on_cached_votes_score"
  add_index "comments", ["cached_votes_total"], name: "index_comments_on_cached_votes_total"
  add_index "comments", ["cached_votes_up"], name: "index_comments_on_cached_votes_up"
  add_index "comments", ["cached_weighted_average"], name: "index_comments_on_cached_weighted_average"
  add_index "comments", ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score"
  add_index "comments", ["cached_weighted_total"], name: "index_comments_on_cached_weighted_total"

  create_table "outdoor_movies", force: true do |t|
    t.date     "date"
    t.string   "movie"
    t.string   "location"
    t.string   "festival"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "month"
  end

  create_table "poll_items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "url"
  end

  add_index "poll_items", ["cached_votes_down"], name: "index_poll_items_on_cached_votes_down"
  add_index "poll_items", ["cached_votes_score"], name: "index_poll_items_on_cached_votes_score"
  add_index "poll_items", ["cached_votes_total"], name: "index_poll_items_on_cached_votes_total"
  add_index "poll_items", ["cached_votes_up"], name: "index_poll_items_on_cached_votes_up"
  add_index "poll_items", ["cached_weighted_average"], name: "index_poll_items_on_cached_weighted_average"
  add_index "poll_items", ["cached_weighted_score"], name: "index_poll_items_on_cached_weighted_score"
  add_index "poll_items", ["cached_weighted_total"], name: "index_poll_items_on_cached_weighted_total"

  create_table "polls", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "voting_closes"
    t.integer  "cached_votes_total",          default: 0
    t.integer  "cached_votes_score",          default: 0
    t.integer  "cached_votes_up",             default: 0
    t.integer  "cached_votes_down",           default: 0
    t.integer  "cached_weighted_score",       default: 0
    t.integer  "cached_weighted_total",       default: 0
    t.float    "cached_weighted_average",     default: 0.0
    t.string   "facebook_image_file_name"
    t.string   "facebook_image_content_type"
    t.integer  "facebook_image_file_size"
    t.datetime "facebook_image_updated_at"
  end

  add_index "polls", ["cached_votes_down"], name: "index_polls_on_cached_votes_down"
  add_index "polls", ["cached_votes_score"], name: "index_polls_on_cached_votes_score"
  add_index "polls", ["cached_votes_total"], name: "index_polls_on_cached_votes_total"
  add_index "polls", ["cached_votes_up"], name: "index_polls_on_cached_votes_up"
  add_index "polls", ["cached_weighted_average"], name: "index_polls_on_cached_weighted_average"
  add_index "polls", ["cached_weighted_score"], name: "index_polls_on_cached_weighted_score"
  add_index "polls", ["cached_weighted_total"], name: "index_polls_on_cached_weighted_total"

  create_table "posts", force: true do |t|
    t.text     "headline"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clicks"
    t.text     "byline"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "featured"
    t.integer  "user_id"
  end

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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "profile_picture"
    t.boolean  "writer"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
