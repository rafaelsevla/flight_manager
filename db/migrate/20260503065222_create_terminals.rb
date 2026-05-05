class CreateTerminals < ActiveRecord::Migration[8.1]
  def change
    create_table :terminals do |t|
      t.string :name, null: false
      t.boolean :has_customs_facility, null: false, default: false

      t.references :airport, null: false, foreign_key: true

      t.timestamps
    end
    add_index :terminals, [ :airport_id, :name ], unique: true
  end
end
