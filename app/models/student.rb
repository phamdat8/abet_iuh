# == Schema Information
#
# Table name: students
#
#  id                :integer          not null, primary key
#  birthday          :date
#  code              :string
#  email             :string
#  first_name        :string
#  last_name         :string
#  phone             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  original_class_id :integer
#
# Indexes
#
#  index_students_on_original_class_id  (original_class_id)
#
class Student < ApplicationRecord
  belongs_to :original_class
  self.per_page = 20

  def self.search(text)
    return self.all if text.nil?
    self.where("first_name LIKE '%#{text}%' OR last_name LIKE '%#{text}%' OR code LIKE '%#{text}%'")
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def abet_type(subject, name)
    lo = LearningOutcome.find_by(subject_id: subject.id, name: name)
    score = get_score(subject.id, lo.abet_score_type)
    if score == 'N/A'
      return 'N/A'
    elsif score > lo.b_a.to_i
      return 'A'
    elsif score > lo.c_b.to_i
      return 'B'
    elsif score > lo.d_c.to_i
      return 'C'
    else
      return 'D'
    end
  end

  def get_score(subject_id, type_name)
    begin
      subject = Subject.find(subject_id)
      if type_name == 'TB'
        sum = 0
        sum_imp = 0
        score_types = ScoreType.where(subject_id: subject_id)
        score_types.each do |type|
          sum_imp += type.importance
          sum += ScoreBoard.find_by(score_type_id: type.id, student_id: id).score * type.importance
        end
        (sum / sum_imp).round(2)
      elsif type_name.split('-')[1].to_i.positive?
        abet_type(subject, type_name.split('-')[0])
      else
        score_type = ScoreType.where(subject_id: subject_id, name: type_name).first
        ScoreBoard.where(score_type_id: score_type.id, student_id: id).first.score
      end
    rescue
      'N/A'
    end
  end
end
