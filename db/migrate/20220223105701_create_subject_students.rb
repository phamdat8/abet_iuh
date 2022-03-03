class CreateSubjectStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_students do |t|
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
