class Admin::SectionClassesController < Admin::HomeController
  def index
    @section_classes = SectionClass.all
  end

  def new
    @section_class = SectionClass.new
  end

  def show
    @class = SectionClass.find(params[:id])
    @permissions = Permission.where(section_class_id: params[:id])
    @students = StudentClass.where(section_class_id: params[:id])
  end

  def create
    SectionClass.create(section_class_params)
    flash.alert = I18n.t('section_class.created')
    @section_classes = SectionClass.all
    render :index
  end

  def update
    SectionClass.create(section_class_params)
  end

  def destroy
    SectionClass.find(params[:id]).destroy
    flash.alert = I18n.t('section_class.destroyed')
    @section_classes = SectionClass.all
    render :index
  end

  private

  def section_class_params
    params.require(:section_class).permit(:subject_id, :code, :semester)
  end
end