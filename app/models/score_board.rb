class ScoreBoard < ApplicationRecord
  belongs_to :student
  belongs_to :score_type
end
