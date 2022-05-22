class AddStatusToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :status, :string, default: 'wait'
  end
end
