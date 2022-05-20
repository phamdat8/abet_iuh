class AddDetailToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :content, :text
    add_reference :subjects, :user, foreign_key: true
  end
end
