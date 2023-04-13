ActiveRecord::Schema.define(version: 2023_04_10_071842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_performances", force: :cascade do |t|
    t.integer "number_of_nominations", null: false
    t.integer "on_site_nomination", null: false
    t.integer "sales_subtotal", null: false
    t.float "duty_hours", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
