class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :document, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :borndate, null: false
      t.string :phone, null: false
      t.references :address, null: false, foreign_key: true


      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
