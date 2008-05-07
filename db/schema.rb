# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 8) do

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms_diario_de_classe_posts", :id => false, :force => true do |t|
    t.integer "diario_de_classe_post_id"
    t.integer "classroom_id"
  end

  create_table "classrooms_parameters", :id => false, :force => true do |t|
    t.integer "parameter_id"
    t.integer "classroom_id"
  end

  create_table "classrooms_students", :id => false, :force => true do |t|
    t.integer "student_id"
    t.integer "classroom_id"
  end

  create_table "classrooms_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "classroom_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentary_id"
    t.string   "commentary_type"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diario_de_classe_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diario_de_classe_posts_parameters", :id => false, :force => true do |t|
    t.integer "parameter_id"
    t.integer "diario_de_classe_post_id"
  end

  create_table "diario_de_classe_posts_students", :id => false, :force => true do |t|
    t.integer "diario_de_classe_post_id"
    t.integer "student_id"
  end

  create_table "evaluations", :force => true do |t|
    t.integer  "student_id"
    t.integer  "parameter_id"
    t.integer  "planning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
  end

  create_table "plannings", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "parameter_id"
    t.integer  "classroom_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "picture"
    t.string   "amadis_username"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.integer  "transfered",      :limit => 1
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "salt",                      :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "school"
    t.string   "city"
    t.string   "state",                     :limit => 3
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
