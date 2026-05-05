class CreateAirportAviationTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :airport_aviation_types do |t|
      t.references :airport, null: false, foreign_key: true
      t.string :type, null: false

      t.timestamps
    end
  end
end
