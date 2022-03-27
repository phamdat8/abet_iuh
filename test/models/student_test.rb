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
require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
