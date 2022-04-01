class Admin::LoTypesController < Admin::HomeController
  def new
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.find(params[:learning_outcome_id])
    @lo_type = LoType.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.find(params[:learning_outcome_id])
    @lo_type = LoType.new
    @lo_type.learning_outcome_id = params[:learning_outcome_id]
    @lo_type.name = params[:name]
    @lo_type.title = params[:title]
    if @lo_type.save
      flash.alert = I18n.t('learing_outcome.created')
      redirect_to admin_subject_learning_outcome_url(@subject, @lo)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.find(params[:learning_outcome_id])
    @lo_type = LoType.find(params[:id])
    @lo_type.destroy
    redirect_to admin_subject_learning_outcome_url(@subject, @lo)
  end

end