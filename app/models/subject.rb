class Subject < ApplicationRecord
  has_many :score_types
  has_many :section_classes
end
