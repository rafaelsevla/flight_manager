class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.string :number, null: false
      t.string :status, null: false
      # 'SCHEDULED' | 'DELAYED' | 'CANCELLED' | 'DEPARTED' | 'ARRIVED'

      t.references :airline, null: false, foreign_key: true
      t.references :origin_airport, null: false, foreign_key: { to_table: :airports }
      t.references :destination_airport, null: false, foreign_key: { to_table: :airports }
      t.references :origin_terminal, foreign_key: { to_table: :terminals }
      t.references :destination_terminal, foreign_key: { to_table: :terminals }
      t.references :airplane, null: false, foreign_key: true

      t.datetime :scheduled_departure, null: false
      t.datetime :scheduled_arrival, null: false

      t.timestamps
    end

    add_index :flights, [ :airline_id, :number ], unique: true
  end
end
