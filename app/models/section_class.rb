# == Schema Information
#
# Table name: section_classes
#
#  id         :integer          not null, primary key
#  code       :string
#  semester   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_section_classes_on_subject_id  (subject_id)
#
class SectionClass < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :subject

  def count_student
    StudentClass.where(section_class_id: id).count
  end

  def export
    score_type =  ScoreType.where(subject_id: subject_id).pluck(:name) << 'TB'
    header = ['CODE', 'Full name'] + score_type
    workbook = RubyXL::Workbook.new
    sheet = workbook[0]
    count = 0
    header.each do |name|
      sheet.add_cell(0, count, name)
      count += 1
    end
    student_ids = StudentClass.where(section_class_id: id).pluck(:student_id)
    @students = Student.where(id: student_ids)
    student_count = 1
    @students.each do |student|
      data = []
      data << student.code << student.name
      score_type.each do |type|
        data << student.get_score(subject_id, type)
      end
      count = 0
      data.each do |value|
        sheet.add_cell(student_count, count, value)
        count += 1
      end
      student_count += 1
    end

    File.delete("storage/export/section_class_#{id}.xlsx") if File.exist?("storage/export/section_class_#{id}.xlsx")
    workbook.write("storage/export/section_class_#{id}.xlsx")
  end
end
