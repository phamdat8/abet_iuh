class CreateJoinTableUsersSectionClasses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :section_classes do |t|
      # t.index [:user_id, :section_class_id]
      # t.index [:section_class_id, :user_id]
    end
  end
end
