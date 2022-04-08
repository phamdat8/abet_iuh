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
  before_create :validate_abet_level
  
  belongs_to :subject
  def self.list_data
    data = self.all
    data.each do |data|
      subject = Subject.find(data.subject_id)
      data.name = "#{subject.name} - #{data.name}"
    end
  end

  def validate_abet_level
    errors[:base] << I18n.t('abet_level.d_c_less_c_b') if d_c.to_i >= c_b.to_i
    errors[:base] << I18n.t('abet_level.c_b_less_b_a') if c_b.to_i >= b_a.to_i
    errors[:base] << I18n.t('abet_level.d_c_invalid') if d_c.to_i > 10 || d_c.to_i < 0
    errors[:base] << I18n.t('abet_level.c_b_invalid') if c_b.to_i > 10 || c_b.to_i < 0
    errors[:base] << I18n.t('abet_level.b_a_invalid') if b_a.to_i > 10 || b_a.to_i < 0
  end
end
