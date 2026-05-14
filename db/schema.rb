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

ActiveRecord::Schema[8.1].define(version: 2026_05_14_233615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.string "district", null: false
    t.string "postal_code", null: false
    t.string "street", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "airline_airports", force: :cascade do |t|
    t.bigint "airline_id", null: false
    t.bigint "airport_id", null: false
    t.datetime "created_at", null: false
    t.boolean "is_hub", default: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_airline_airports_on_airline_id"
    t.index ["airport_id"], name: "index_airline_airports_on_airport_id"
  end

  create_table "airlines", force: :cascade do |t|
    t.string "country_code", null: false
    t.datetime "created_at", null: false
    t.string "iata_code", null: false
    t.string "icao_code", null: false
    t.string "name", null: false
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.index ["iata_code"], name: "index_airlines_on_iata_code", unique: true
    t.index ["icao_code"], name: "index_airlines_on_icao_code", unique: true
  end

  create_table "airplane_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "cruise_speed_kmh", null: false
    t.string "manufacturer", null: false
    t.string "name", null: false
    t.integer "range_km", null: false
    t.integer "typical_seats", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_airplane_models_on_name", unique: true
  end

  create_table "airplanes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "model_id", null: false
    t.string "status", default: "PENDING", null: false
    t.integer "total_seats", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_airplanes_on_model_id"
  end

  create_table "airport_aviation_types", force: :cascade do |t|
    t.bigint "airport_id", null: false
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_airport_aviation_types_on_airport_id"
  end

  create_table "airports", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.integer "elevation_in_meters"
    t.string "iata_code", null: false
    t.string "icao_code", null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.string "name", null: false
    t.string "scope", null: false
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.string "usage", null: false
    t.index ["address_id"], name: "index_airports_on_address_id"
    t.index ["iata_code"], name: "index_airports_on_iata_code", unique: true
    t.index ["icao_code"], name: "index_airports_on_icao_code", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.boolean "checked_in", default: false, null: false
    t.datetime "created_at", null: false
    t.bigint "flight_id", null: false
    t.string "payment_status", default: "PENDING", null: false
    t.decimal "price_paid", precision: 10, scale: 2
    t.string "reference", null: false
    t.bigint "seat_id", null: false
    t.string "status", default: "PENDING", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["flight_id", "seat_id"], name: "index_bookings_on_flight_id_and_seat_id", unique: true
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["reference"], name: "index_bookings_on_reference", unique: true
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "country_code", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "state_code", null: false
    t.string "timezone", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "airline_id", null: false
    t.bigint "airplane_id", null: false
    t.datetime "created_at", null: false
    t.bigint "destination_airport_id", null: false
    t.bigint "destination_terminal_id"
    t.string "number", null: false
    t.bigint "origin_airport_id", null: false
    t.bigint "origin_terminal_id"
    t.datetime "scheduled_arrival", null: false
    t.datetime "scheduled_departure", null: false
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id", "number"], name: "index_flights_on_airline_id_and_number", unique: true
    t.index ["airline_id"], name: "index_flights_on_airline_id"
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
    t.index ["destination_airport_id"], name: "index_flights_on_destination_airport_id"
    t.index ["destination_terminal_id"], name: "index_flights_on_destination_terminal_id"
    t.index ["origin_airport_id"], name: "index_flights_on_origin_airport_id"
    t.index ["origin_terminal_id"], name: "index_flights_on_origin_terminal_id"
  end

  create_table "group_permissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "group_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "permission_id"], name: "index_group_permissions_on_group_id_and_permission_id", unique: true
    t.index ["group_id"], name: "index_group_permissions_on_group_id"
    t.index ["permission_id"], name: "index_group_permissions_on_permission_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.uuid "uuid"
    t.index ["name"], name: "index_groups_on_name", unique: true
    t.index ["uuid"], name: "index_groups_on_uuid", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.string "resource"
    t.datetime "updated_at", null: false
    t.index ["resource", "action"], name: "index_permissions_on_resource_and_action", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "destination_airport_id", null: false
    t.bigint "destination_terminal_id"
    t.bigint "flight_id", null: false
    t.integer "layover_in_minutes", null: false
    t.bigint "origin_airport_id", null: false
    t.bigint "origin_terminal_id"
    t.datetime "scheduled_arrival", null: false
    t.datetime "scheduled_departure", null: false
    t.integer "sequence", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_airport_id"], name: "index_routes_on_destination_airport_id"
    t.index ["destination_terminal_id"], name: "index_routes_on_destination_terminal_id"
    t.index ["flight_id", "sequence"], name: "index_routes_on_flight_id_and_sequence", unique: true
    t.index ["flight_id"], name: "index_routes_on_flight_id"
    t.index ["origin_airport_id"], name: "index_routes_on_origin_airport_id"
    t.index ["origin_terminal_id"], name: "index_routes_on_origin_terminal_id"
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "airplane_id", null: false
    t.string "class"
    t.datetime "created_at", null: false
    t.string "number", null: false
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["airplane_id", "number"], name: "index_seats_on_airplane_id_and_number", unique: true
    t.index ["airplane_id"], name: "index_seats_on_airplane_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "terminals", force: :cascade do |t|
    t.bigint "airport_id", null: false
    t.datetime "created_at", null: false
    t.boolean "has_customs_facility", default: false, null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id", "name"], name: "index_terminals_on_airport_id_and_name", unique: true
    t.index ["airport_id"], name: "index_terminals_on_airport_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.bigint "booking_id", null: false
    t.string "card_last_four", limit: 4
    t.datetime "created_at", null: false
    t.string "gateway_transaction_id", null: false
    t.datetime "paid_at"
    t.string "payment_method", null: false
    t.string "status", default: "PENDING", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["booking_id"], name: "index_transactions_on_booking_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "group_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.date "born_date", null: false
    t.datetime "created_at", null: false
    t.string "document", null: false
    t.string "email_address", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest", null: false
    t.string "phone", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "airline_airports", "airlines"
  add_foreign_key "airline_airports", "airports"
  add_foreign_key "airplanes", "airplane_models", column: "model_id"
  add_foreign_key "airport_aviation_types", "airports"
  add_foreign_key "airports", "addresses"
  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "seats"
  add_foreign_key "bookings", "users"
  add_foreign_key "flights", "airlines"
  add_foreign_key "flights", "airplanes"
  add_foreign_key "flights", "airports", column: "destination_airport_id"
  add_foreign_key "flights", "airports", column: "origin_airport_id"
  add_foreign_key "flights", "terminals", column: "destination_terminal_id"
  add_foreign_key "flights", "terminals", column: "origin_terminal_id"
  add_foreign_key "group_permissions", "groups"
  add_foreign_key "group_permissions", "permissions"
  add_foreign_key "routes", "airports", column: "destination_airport_id"
  add_foreign_key "routes", "airports", column: "origin_airport_id"
  add_foreign_key "routes", "flights"
  add_foreign_key "routes", "terminals", column: "destination_terminal_id"
  add_foreign_key "routes", "terminals", column: "origin_terminal_id"
  add_foreign_key "seats", "airplanes"
  add_foreign_key "sessions", "users"
  add_foreign_key "terminals", "airports"
  add_foreign_key "transactions", "bookings"
  add_foreign_key "transactions", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "users", "addresses"
end
