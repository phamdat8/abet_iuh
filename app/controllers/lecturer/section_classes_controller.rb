class Lecturer::SectionClassesController < Lecturer::HomeController
  def index

    class_ids = Permission.where(user_id: current_user.id).group(:section_class_id).pluck(:section_class_id)
    @section_classes = SectionClass.where(id: class_ids)
  end

  def new
    @section_class = SectionClass.new
  end

  def show
    @data = {}
    @data['A'] = 0
    @data['B'] = 0
    @data['C'] = 0
    @data['D'] = 0
    @data['N/A'] = 0
    @class = SectionClass.find(params[:id])
    @scores = ScoreBoard.where(section_class_id: params[:id])
    @score_types = ScoreType.where(subject_id: @class.subject_id).pluck(:name) << 'TB'
    student_ids = StudentClass.where(section_class_id: params[:id]).pluck(:student_id)
    @subject = Subject.find(@class.subject_id)
    @students = Student.where(id: student_ids)
    @students.each do | student |
      score = student.get_score(@subject.id, @subject.abet_score_type)
      if score == 'N/A'
        @data['N/A'] += 1
      elsif score > @subject.b_a.to_i
        @data['A'] += 1
      elsif score > @subject.c_b.to_i
        @data['B'] += 1
      elsif score > @subject.d_c.to_i
        @data['C'] += 1
      else
        @data['D'] += 1
      end
    end
    @pie_data = {}
    @pie_data['A'] =  @data['A']*100 / @students.count
    @pie_data['B'] =  @data['B']*100 / @students.count
    @pie_data['C'] =  @data['C']*100 / @students.count
    @pie_data['D'] =  @data['D']*100 / @students.count
    @pie_data['N/A'] =@data['N/A']*100 / @students.count
    
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

  def update
    SectionClass.create(section_class_params)
  end

  private

  def section_class_params
    params.require(:section_class).permit(:subject_id, :code)
  end
end