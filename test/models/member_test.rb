# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  owner      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_members_on_room_id  (room_id)
#  index_members_on_user_id  (user_id)
#
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
