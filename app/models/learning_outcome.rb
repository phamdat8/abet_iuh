# == Schema Information
#
# Table name: learning_outcomes
#
#  id         :integer          not null, primary key
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_learning_outcomes_on_subject_id  (subject_id)
#
class LearningOutcome < ApplicationRecord
  belongs_to :subject
end
