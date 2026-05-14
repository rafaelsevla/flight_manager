class ChangeOriginalAirportToOriginAirportInRoutes < ActiveRecord::Migration[8.1]
  def change
    rename_column :routes, :original_airport_id, :origin_airport_id
  end
end
