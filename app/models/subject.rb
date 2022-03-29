# == Schema Information
#
# Table name: subjects
#
#  id              :integer          not null, primary key
#  abet_score_type :string
#  b_a             :string
#  c_b             :string
#  d_c             :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Subject < ApplicationRecord
  has_many :score_types
  has_many :section_classes
end
