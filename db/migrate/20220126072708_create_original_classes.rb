class CreateOriginalClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :original_classes do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
