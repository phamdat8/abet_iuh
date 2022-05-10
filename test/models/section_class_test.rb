# == Schema Information
#
# Table name: section_classes
#
#  id          :integer          not null, primary key
#  code        :string
#  semester    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  semester_id :integer
#  subject_id  :integer
#
# Indexes
#
#  index_section_classes_on_semester_id  (semester_id)
#  index_section_classes_on_subject_id   (subject_id)
#
require 'test_helper'

class SectionClassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
