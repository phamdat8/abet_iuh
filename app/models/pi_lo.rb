# == Schema Information
#
# Table name: pi_los
#
#  id                  :integer          not null, primary key
#  priority            :string
#  process             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  learning_outcome_id :integer
#  pi_id               :integer
#
# Indexes
#
#  index_pi_los_on_learning_outcome_id  (learning_outcome_id)
#  index_pi_los_on_pi_id                (pi_id)
#
class PiLo < ApplicationRecord
  belongs_to :pi
  belongs_to :learning_outcome

  def subject_name
    learning_outcome.subject.name
  end

  def lo_name
    learning_outcome.name
  end
end
