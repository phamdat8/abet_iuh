# == Schema Information
#
# Table name: subjects
#
#  id              :integer          not null, primary key
#  abet_score_type :string
#  b_a             :string
#  c_b             :string
#  d_c             :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Subject < ApplicationRecord
  has_many :score_types, :dependent => :destroy
  has_many :section_classes, :dependent => :destroy
  self.per_page = 20

  def self.search(text)
    return self.all if text.nil?
    self.where("name LIKE '%#{text}%'")
  end
end
