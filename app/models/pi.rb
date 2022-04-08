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
end
