class ChangeBorndateToDateInUsers < ActiveRecord::Migration[8.1]
  def change
    change_column :users, :borndate, 'date USING borndate::date'
  end
end
