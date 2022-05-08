# == Schema Information
#
# Table name: pis
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  so_id      :integer
#
# Indexes
#
#  index_pis_on_so_id  (so_id)
#
class Pi < ApplicationRecord
  belongs_to :so

  def count_lo
    count = PiLo.where(pi_id: id).count
    return 1 if count.zero?

    count
  end
end
