class CreateScoreBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :score_boards do |t|
      t.references :student, foreign_key: true
      t.integer :score
      t.references :score_type, foreign_key: true

      t.timestamps
    end
  end
end
