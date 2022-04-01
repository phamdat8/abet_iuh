class Admin::LearningOutcomesController < Admin::HomeController
  def index
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.new
    @lo.subject_id = params[:subject_id]
    @lo.name = params[:name]
    @lo.title = params[:title]
    if @lo.save
      flash.alert = I18n.t('learing_outcome.created')
      redirect_to admin_subject_url(@subject)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.find(params[:id])
    @lo_types = LoType.where(learning_outcome_id: params[:id])
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.find(params[:id])
    @lo.destroy
    flash.alert = I18n.t('learing_outcome.deleted')
    redirect_to admin_subject_url(@subject)
  end
end