# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100315160752) do

  create_table "attenders", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "phone"
  end

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.integer  "organizator"
    t.integer  "duration"
  end

  add_index "meetings", ["organizator"], :name => "meetings_organizator_fk"

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["meeting_id"], :name => "participations_meeting_id_fk"
  add_index "participations", ["user_id"], :name => "participations_user_id_fk"

  create_table "proposal_date_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proposal_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposal_date_users", ["proposal_date_id"], :name => "proposal_date_users_proposal_date_id_fk"
  add_index "proposal_date_users", ["user_id"], :name => "proposal_date_users_user_id_fk"

  create_table "proposal_dates", :force => true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_id"
  end

  add_index "proposal_dates", ["meeting_id"], :name => "proposal_dates_meeting_id_fk"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  add_foreign_key "meetings", "attenders", :name => "meetings_organizator_fk", :column => "organizator"

  add_foreign_key "participations", "meetings", :name => "participations_meeting_id_fk"
  add_foreign_key "participations", "users", :name => "participations_user_id_fk"

  add_foreign_key "proposal_date_users", "proposal_dates", :name => "proposal_date_users_proposal_date_id_fk"
  add_foreign_key "proposal_date_users", "users", :name => "proposal_date_users_user_id_fk"

  add_foreign_key "proposal_dates", "meetings", :name => "proposal_dates_meeting_id_fk"

end
