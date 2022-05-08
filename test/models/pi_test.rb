# == Schema Information
#
# Table name: pis
#
#  id         :integer          not null, primary key
#  content    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  so_id      :integer
#
# Indexes
#
#  index_pis_on_so_id  (so_id)
#
require 'test_helper'

class PiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
