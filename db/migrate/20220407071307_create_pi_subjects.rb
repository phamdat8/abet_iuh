class CreatePiSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :pi_los do |t|
      t.references :pi, foreign_key: true
      t.references :learning_outcome, foreign_key: true
      t.string :process
      t.string :priority

      t.timestamps
    end
  end
end
