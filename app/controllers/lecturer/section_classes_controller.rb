class Lecturer::SectionClassesController < Lecturer::HomeController
  def index
    @section_classes = SectionClass.all
  end

  def new
    @section_class = SectionClass.new
  end

  def show
    @class = SectionClass.find(params[:id])
    @scores = ScoreBoard.where(section_class_id: params[:id])
    @score_types = ScoreType.where(subject_id: @class.subject_id).pluck(:name) << 'TB'
    student_ids = StudentClass.where(section_class_id: params[:id]).pluck(:student_id)
    @students = Student.where(id: student_ids)
  end

  def create
    SectionClass.create(section_class_params)
    flash.alert = I18n.t('student.created')
    @section_classes = SectionClass.all
    render :index
  end

  def export
    @class = SectionClass.find(params[:section_class_id])
    @class.export
    send_file("#{Rails.root}/tmp/export/section_class_#{@class.id}.xlsx")
  end

  def update
    SectionClass.create(section_class_params)
  end

  private

  def section_class_params
    params.require(:section_class).permit(:subject_id, :code)
  end
end