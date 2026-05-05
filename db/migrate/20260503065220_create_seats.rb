class CreateSeats < ActiveRecord::Migration[8.1]
  def change
    create_table :seats do |t|
      t.string :number, null: false
      t.string :class # 'ECONOMY' | 'PREMIUM_ECONOMY' | 'BUSINESS' | 'FIRST'
      t.string :type # 'WINDOW' | 'AISLE' | 'EXIT_ROW' | 'EXTRA_LEGROOM'

      t.references :airplane, null: false, foreign_key: true

      t.timestamps
    end

    add_index :seats, [ :airplane_id, :number ], unique: true
  end
end
