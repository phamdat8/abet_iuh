class CreateLoTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :lo_types do |t|
      t.references :learning_outcome, foreign_key: true
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
