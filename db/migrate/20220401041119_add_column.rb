class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :section_classes, :semester, :string
  end
end
