class ChangeDataTypeForScore < ActiveRecord::Migration[5.2]
  change_table :score_boards do |t|
    t.change :score, :float
  end
end
