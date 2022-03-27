# == Schema Information
#
# Table name: subject_students
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  subject_id :integer
#
# Indexes
#
#  index_subject_students_on_student_id  (student_id)
#  index_subject_students_on_subject_id  (subject_id)
#
class SubjectStudent < ApplicationRecord
  belongs_to :student
  belongs_to :subject
end
