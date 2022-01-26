class Student < ApplicationRecord
  belongs_to :original_class

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
