class RenameTypeInAirportAviationTypes < ActiveRecord::Migration[8.1]
  def change
    rename_column :airport_aviation_types, :type, :category
  end
end
