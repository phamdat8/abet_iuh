# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Document < ApplicationRecord
  has_one_attached :file
  self.per_page = 10

  def self.search(text, status)
    value = self.all
    value = value.where("name LIKE '%#{text}%'") if text
    return value if status == 'all'
    value = value.where(status: status) if status

    value
  end
end
