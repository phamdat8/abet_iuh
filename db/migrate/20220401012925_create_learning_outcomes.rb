class CreateLearningOutcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_outcomes do |t|
      t.references :subject, foreign_key: true
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
