# == Schema Information
#
# Table name: learning_outcomes
#
#  id              :integer          not null, primary key
#  a_content       :string
#  abet_score_type :string
#  b_a             :string
#  b_content       :string
#  c_b             :string
#  c_content       :string
#  d_c             :string
#  d_content       :string
#  name            :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  subject_id      :integer
#
# Indexes
#
#  index_learning_outcomes_on_subject_id  (subject_id)
#
class LearningOutcome < ApplicationRecord
  belongs_to :subject
  def self.list_data
    data = self.all
    data.each do |data|
      subject = Subject.find(data.subject_id)
      data.name = "#{subject.name} - #{data.name}"
    end
  end
end
