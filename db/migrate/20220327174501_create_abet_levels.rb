class CreateAbetLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :abet_levels do |t|
      t.string :type
      t.string :value
      t.references :subject

      t.timestamps
    end
  end
end
