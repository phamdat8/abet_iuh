class Lecturer::SectionClassesController < Lecturer::HomeController
  def index
    class_ids = Permission.where(user_id: current_user.id).group(:section_class_id).pluck(:section_class_id)
    @section_classes = SectionClass.where(id: class_ids)

  end

  def new
    @section_class = SectionClass.new
  end

  def show
    @class = SectionClass.find(params[:id])
    list = []
    @loes = LearningOutcome.where(subject_id: @class.subject_id)
    @loes.each do |i|
      list << "#{i.name}-#{i.id}"
    end
    @scores = ScoreBoard.where(section_class_id: params[:id])
    @score_types = ScoreType.where(subject_id: @class.subject_id).pluck(:name) << 'TB'
    @score_types += list
    student_ids = StudentClass.where(section_class_id: params[:id]).pluck(:student_id)
    @subject = Subject.find(@class.subject_id)
    @students = Student.where(id: student_ids)
    @lo_data = []
    @loes.each do |lo|
      data = {}
      data["name"] = lo.name
      data['A'] = 0
      data['B'] = 0
      data['C'] = 0
      data['D'] = 0
      @students.each do |student|
        type = student.get_score(@class.subject_id, "#{lo.name}-#{lo.id}")
        data[type.to_s] += 1 unless data[type.to_s].nil?
      end
      @lo_data << data
    end
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
    send_file("#{Rails.root}/storage/export/section_class_#{@class.id}.xlsx")
  end

  def update_score
    @section_class = SectionClass.find(params[:class_id])
    score_type = ScoreType.find_by(subject_id: params[:subject_id], name: params[:name])
    a = ScoreBoard.find_by(score_type_id: score_type.id, student_id: params[:student_id])
    if a.nil?
      ScoreBoard.create(score_type_id: score_type.id, student_id: params[:student_id], score: params[:score])
    else
      a.update(score: params[:score])
    end
    redirect_to lecturer_section_class_url(@section_class)
  end

  def update
    SectionClass.create(section_class_params)
  end

  private

  def section_class_params
    params.require(:section_class).permit(:subject_id, :code)
  end
end