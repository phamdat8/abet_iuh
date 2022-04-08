class Add < ActiveRecord::Migration[5.2]
  def change
    add_reference :section_classes, :semester
  end
end
