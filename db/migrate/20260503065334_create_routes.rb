class CreateRoutes < ActiveRecord::Migration[8.1]
  def change
    create_table :routes do |t|
      t.integer :sequence, null: false
      t.integer :layover_in_minutes, null: false
      t.datetime :scheduled_departure, null: false
      t.datetime :scheduled_arrival, null: false

      t.references :flight, null: false, foreign_key: true
      t.references :original_airport, null: false, foreign_key: { to_table: :airports }
      t.references :destination_airport, null: false, foreign_key: { to_table: :airports }
      t.references :original_terminal, foreign_key: { to_table: :terminals }
      t.references :destination_terminal, foreign_key: { to_table: :terminals }

      t.timestamps
    end

    add_index :routes, [ :flight_id, :sequence ], unique: true
  end
end
