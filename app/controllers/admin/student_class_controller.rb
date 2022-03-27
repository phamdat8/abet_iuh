class Admin::StudentClassController < Admin::HomeController
  def new
    @class = SectionClass.find(params[:section_class_id])
    @invite = StudentClass.new
  end

  def create
    @class = SectionClass.find(params[:section_class_id])
    @invite = StudentClass.new
    @invite.student_id = params[:student_id]
    @invite.section_class_id = params[:section_class_id]
    if params[:student_id] == '0'
      @invite.errors[:base] << I18n.t('student.not_exists')
      render 'new'
      return
    end
    if @invite.save
      flash.alert = I18n.t('student_class.created')
      redirect_to admin_section_class_url(@class)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def destroy
    StudentClass.find(params[:id]).destroy
    @class = SectionClass.find(params['section_class_id'])
    flash.alert = I18n.t('permission.destroyed')
    redirect_to admin_section_class_url(@class)
  end
end