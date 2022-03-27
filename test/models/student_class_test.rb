# == Schema Information
#
# Table name: student_classes
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  section_class_id :integer
#  student_id       :integer
#
# Indexes
#
#  index_student_classes_on_section_class_id  (section_class_id)
#  index_student_classes_on_student_id        (student_id)
#
require 'test_helper'

class StudentClassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
