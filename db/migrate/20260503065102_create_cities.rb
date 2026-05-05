class CreateCities < ActiveRecord::Migration[8.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :state_code, null: false
      t.string :country_code, null: false
      t.string :timezone, null: false

      t.timestamps
    end
  end
end
