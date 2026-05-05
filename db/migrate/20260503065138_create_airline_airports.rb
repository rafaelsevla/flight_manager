class CreateAirlineAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airline_airports do |t|
      t.references :airline, null: false, foreign_key: true
      t.references :airport, null: false, foreign_key: true

      t.boolean :is_hub, default: false

      t.timestamps
    end
  end
end
