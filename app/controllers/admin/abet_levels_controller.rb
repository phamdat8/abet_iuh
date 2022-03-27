class Admin::AbetLevelsController < Admin::HomeController
  def new
    @abet_level = AbetLevel.new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @abet_level = AbetLevel.new
    @abet_level.errors[:base] << I18n.t('abet_level.score_type_required')
    byebug
  end
end