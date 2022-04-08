class AddColumnLo < ActiveRecord::Migration[5.2]
  def change
    add_column :learning_outcomes, :d_c, :string
    add_column :learning_outcomes, :c_b, :string
    add_column :learning_outcomes, :b_a, :string
    add_column :learning_outcomes, :abet_score_type, :string
    add_column :learning_outcomes, :a_content, :string
    add_column :learning_outcomes, :b_content, :string
    add_column :learning_outcomes, :c_content, :string
    add_column :learning_outcomes, :d_content, :string
  end
end
