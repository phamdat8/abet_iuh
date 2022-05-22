# == Schema Information
#
# Table name: subjects
#
#  id              :integer          not null, primary key
#  abet_score_type :string
#  b_a             :string
#  c_b             :string
#  content         :text
#  d_c             :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_subjects_on_user_id  (user_id)
#
require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
