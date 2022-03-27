# == Schema Information
#
# Table name: abet_levels
#
#  id         :integer          not null, primary key
#  type       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_abet_levels_on_subject_id  (subject_id)
#
require 'test_helper'

class AbetLevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
