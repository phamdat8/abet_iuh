# == Schema Information
#
# Table name: original_classes
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OriginalClass < ApplicationRecord
  has_many :students
end
