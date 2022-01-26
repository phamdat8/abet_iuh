class CreateAdminSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_subjects do |t|
      t.string :name

      t.timestamps
    end
  end
end
