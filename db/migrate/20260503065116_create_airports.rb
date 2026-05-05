class CreateAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airports do |t|
      t.string :name, null: false
      t.string :iata_code, null: false
      t.string :icao_code, null: false
      t.decimal :latitude, null: false, precision: 10, scale: 6
      t.decimal :longitude, null: false, precision: 10, scale: 6
      t.string :usage, null: false # 'PUBLIC' | 'PRIVATE'
      t.string :scope, null: false # 'NATIONAL' | 'INTERNATIONAL'
      t.string :status, null: false # 'ACTIVE' | 'INACTIVE'
      t.integer :elevation_in_meters

      t.references :address, null: false, foreign_key: true

      t.timestamps
    end

    add_index :airports, :iata_code, unique: true
    add_index :airports, :icao_code, unique: true
  end
end
