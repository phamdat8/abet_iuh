class CreateStudentClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_classes do |t|
      t.references :student
      t.references :section_class
      
      t.timestamps
    end
  end
end
