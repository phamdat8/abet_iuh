# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Document < ApplicationRecord
  has_one_attached :file
  self.per_page = 10

  def self.search(text)
    return self.all if text.nil?
    self.where("name LIKE '%#{text}%'")
  end
end
