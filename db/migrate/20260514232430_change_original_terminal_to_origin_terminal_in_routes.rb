class ChangeOriginalTerminalToOriginTerminalInRoutes < ActiveRecord::Migration[8.1]
  def change
    rename_column :routes, :original_terminal_id, :origin_terminal_id
  end
end
