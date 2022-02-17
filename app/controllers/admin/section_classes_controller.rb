class Admin::SectionClassesController < Admin::HomeController
  def index
    @section_classes = SectionClass.all
  end

  def new
    @section_class = SectionClass.new
  end

  def show
    @section_class = SectionClass.find(params[:id])
  end

  def create
    SectionClass.create(section_class_params)
    flash.alert = I18n.t('student.created')
    @section_classes = SectionClass.all
    render :index
  end

  def update
    SectionClass.create(section_class_params)
  end

  private

  def section_class_params
    params.require(:section_class).permit(:subject_id, :code)
  end
end