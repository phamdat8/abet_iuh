class CreateSos < ActiveRecord::Migration[5.2]
  def change
    create_table :sos do |t|
      t.string :name
      t.string :content
      t.references :semester

      t.timestamps
    end
  end
end
