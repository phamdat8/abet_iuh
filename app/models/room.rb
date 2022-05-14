# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_rooms_on_user_id  (user_id)
#
class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :delete_all
  has_many :members, dependent: :delete_all
end
