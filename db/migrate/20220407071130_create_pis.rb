class CreatePis < ActiveRecord::Migration[5.2]
  def change
    create_table :pis do |t|
      t.string :content
      t.references :so, foreign_key: true

      t.timestamps
    end
  end
end
