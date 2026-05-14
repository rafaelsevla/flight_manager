class CreateGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.uuid :uuid

      t.timestamps
    end

    add_index :groups, :name, unique: true
    add_index :groups, :uuid, unique: true
  end
end
