class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
