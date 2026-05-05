class CreateAirplaneModels < ActiveRecord::Migration[8.1]
  def change
    create_table :airplane_models do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.integer :typical_seats, null: false
      t.integer :range_km, null: false
      t.integer :cruise_speed_kmh, null: false

      t.timestamps
    end

    add_index :airplane_models, :name, unique: true
  end
end
