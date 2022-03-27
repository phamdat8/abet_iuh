# == Schema Information
#
# Table name: students
#
#  id                :integer          not null, primary key
#  birthday          :date
#  code              :string
#  email             :string
#  first_name        :string
#  last_name         :string
#  phone             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  original_class_id :integer
#
# Indexes
#
#  index_students_on_original_class_id  (original_class_id)
#
class Student < ApplicationRecord
  belongs_to :original_class

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
