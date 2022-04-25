# == Schema Information
#
# Table name: sos
#
#  id          :integer          not null, primary key
#  content     :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  semester_id :integer
#
# Indexes
#
#  index_sos_on_semester_id  (semester_id)
#
class So < ApplicationRecord
  before_destroy :clear_data
  def semester_name
    Semester.find(semester_id).name
  end

  def clear_data
    Pi.where(so_id: id).destroy_all
  end
end
