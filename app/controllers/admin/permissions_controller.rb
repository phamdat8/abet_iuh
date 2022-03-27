class Admin::PermissionsController < Admin::HomeController
  def new
    @class = SectionClass.find(params[:section_class_id])
    @permission = Permission.new
  end

  def create
    @permission = Permission.new(permission_param)
    @permission.section_class_id = params['section_class_id']
    @class = SectionClass.find(params['section_class_id'])
    if Permission.exists?(section_class_id: params['section_class_id'], misson: 'theory') && @permission.misson == 'theory'
      @permission.errors[:base] << I18n.t('theory.teacher.existed')
      render 'new'
      return
    end
    if @permission.save
      flash.alert = I18n.t('permission.created')
      redirect_to admin_section_class_url(@class)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def destroy
    Permission.find(params[:id]).destroy
    @class = SectionClass.find(params['section_class_id'])
    flash.alert = I18n.t('permission.destroyed')
    redirect_to admin_section_class_url(@class)
  end

  def permission_param
    params.require(:permission).permit(:user_id, :misson)
  end
end