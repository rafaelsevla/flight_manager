class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.string :status, null: false, default: 'PENDING'
      # 'PENDING' | 'PAID' | 'CONFIRMED' | 'CANCELLED' | 'CHECKED_IN'
      t.string :payment_status, null: false, default: 'PENDING'
      # 'PENDING' | 'PAID' | 'REFUNDED' | 'FAILED'
      t.string :reference, null: false
      t.boolean :checked_in, null: false, default: false
      t.decimal :price_paid, precision: 10, scale: 2

      t.references :flight, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true

      t.timestamps
    end

    add_index :bookings, :reference, unique: true
    add_index :bookings, [ :flight_id, :seat_id ], unique: true
  end
end
