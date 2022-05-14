# == Schema Information
#
# Table name: score_boards
#
#  id            :integer          not null, primary key
#  score         :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  score_type_id :integer
#  student_id    :integer
#
# Indexes
#
#  index_score_boards_on_score_type_id  (score_type_id)
#  index_score_boards_on_student_id     (student_id)
#
require 'test_helper'

class ScoreBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
