class AddSubjectIdToSectionClass < ActiveRecord::Migration[5.2]
  def change
    add_reference :section_classes, :subject, index: true
  end
end
