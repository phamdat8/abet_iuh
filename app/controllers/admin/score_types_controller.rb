class Admin::ScoreTypesController < Admin::HomeController
  def new
    @score_type = ScoreType.new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    score_type = ScoreType.new(score_type_params)
    score_type.subject_id = params[:subject_id]
    flash.alert = I18n.t('score_type.created')
    score_type.save
    redirect_to admin_subject_path(Subject.find(params[:subject_id]))
  end

  def destroy
    ScoreType.find(params[:id]).destroy
    redirect_to admin_subject_path(Subject.find(params[:subject_id]))
  end

  private

  def score_type_params
    params.require(:score_type).permit(:name, :importance)
  end

end
