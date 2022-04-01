# == Schema Information
#
# Table name: lo_types
#
#  id                  :integer          not null, primary key
#  name                :string
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  learning_outcome_id :integer
#
# Indexes
#
#  index_lo_types_on_learning_outcome_id  (learning_outcome_id)
#
class LoType < ApplicationRecord
  belongs_to :learning_outcome
end
