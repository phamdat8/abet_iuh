class CreateSectionClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :section_classes do |t|
      t.string :code

      t.timestamps
    end
  end
end
