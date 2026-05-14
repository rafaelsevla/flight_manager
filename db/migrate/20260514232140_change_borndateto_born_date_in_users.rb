class ChangeBorndatetoBornDateInUsers < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :borndate, :born_date
  end
end
