class RemoveForeinKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :posts, :users
  end
end
