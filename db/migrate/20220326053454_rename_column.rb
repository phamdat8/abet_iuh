class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :permissions, :type, :misson
  end
end
