class CreateAirlines < ActiveRecord::Migration[8.1]
  def change
    create_table :airlines do |t|
      t.string :name, null: false
      t.string :iata_code, null: false
      t.string :icao_code, null: false
      t.string :country_code, null: false
      t.string :status, null: false # 'ACTIVE' | 'INACTIVE' | 'SUSPENDED' | 'BANKRUPT'

      t.timestamps
    end

    add_index :airlines, :iata_code, unique: true
    add_index :airlines, :icao_code, unique: true
  end
end
