class CreateGroupPermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :group_permissions do |t|
      t.references :group, null: false, foreign_key: true
      t.references :permission, null: false, foreign_key: true

      t.timestamps
    end

    add_index :group_permissions, [ :group_id, :permission_id ], unique: true
  end
end
