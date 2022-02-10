class CreateScoreTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :score_types do |t|
      t.string :name
      t.integer :importance
      t.references :subject

      t.timestamps
    end
  end
end
