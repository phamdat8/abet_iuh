# == Schema Information
#
# Table name: section_classes
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_section_classes_on_subject_id  (subject_id)
#
class SectionClass < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :subject

  def count_student
    StudentClass.where(section_class_id: id).count
  end
end
