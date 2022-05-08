class AddColumnNameToPi < ActiveRecord::Migration[5.2]
  def change
    add_column :pis, :name, :string
  end
end
