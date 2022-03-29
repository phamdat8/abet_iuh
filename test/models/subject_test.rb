# == Schema Information
#
# Table name: subjects
#
#  id              :integer          not null, primary key
#  abet_score_type :string
#  b_a             :string
#  c_b             :string
#  d_c             :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
