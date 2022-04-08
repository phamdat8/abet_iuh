# == Schema Information
#
# Table name: pi_subjects
#
#  id         :integer          not null, primary key
#  process    :string
#  stack      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pi_id      :integer
#  subject_id :integer
#
# Indexes
#
#  index_pi_subjects_on_pi_id       (pi_id)
#  index_pi_subjects_on_subject_id  (subject_id)
#
require 'test_helper'

class PiSubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
