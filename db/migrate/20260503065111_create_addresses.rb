class CreateAddresses < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :district, null: false
      t.string :postal_code, null: false

      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
