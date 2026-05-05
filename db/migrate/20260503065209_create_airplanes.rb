class CreateAirplanes < ActiveRecord::Migration[8.1]
  def change
    create_table :airplanes do |t|
      t.references :model, null: false, foreign_key: { to_table: :airplane_models }
      t.integer :total_seats, null: false
      t.string :status, null: false, default: 'PENDING'
      # 'PENDING' | 'ACTIVE' | 'MAINTENANCE' | 'RETIRED' | 'STORED'

      t.timestamps
    end
  end
end
