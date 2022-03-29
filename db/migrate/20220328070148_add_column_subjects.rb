class AddColumnSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :d_c, :string
    add_column :subjects, :c_b, :string
    add_column :subjects, :b_a, :string
    add_column :subjects, :abet_score_type, :string
  end
end
