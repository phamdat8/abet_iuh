class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.references :original_class
      t.date :birthday
      t.string :code
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
