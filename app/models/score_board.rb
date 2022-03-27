# == Schema Information
#
# Table name: score_boards
#
#  id            :integer          not null, primary key
#  is_auto       :boolean
#  score         :integer
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
class ScoreBoard < ApplicationRecord
  belongs_to :student
  belongs_to :score_type
end
