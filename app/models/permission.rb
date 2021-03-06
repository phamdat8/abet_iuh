# == Schema Information
#
# Table name: permissions
#
#  id               :integer          not null, primary key
#  misson           :string
#  value            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  section_class_id :integer
#  user_id          :integer
#
# Indexes
#
#  index_permissions_on_section_class_id  (section_class_id)
#  index_permissions_on_user_id           (user_id)
#
class Permission < ApplicationRecord
  belongs_to :user

  def user_name
    User.find(user_id).name
  end
end
