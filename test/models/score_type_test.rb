# == Schema Information
#
# Table name: score_types
#
#  id         :integer          not null, primary key
#  calculate  :string
#  code       :string
#  importance :integer
#  is_auto    :boolean
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_score_types_on_subject_id  (subject_id)
#
require 'test_helper'

class ScoreTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
