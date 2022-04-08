class Admin::LearningOutcomesController < Admin::HomeController
  def index
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @lo = LearningOutcome.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    data = {
      subject_id: params[:subject_id],
      name: params[:name],
      title: params[:title],
      d_c: params[:d_c],
      c_b: params[:c_b],
      b_a: params[:b_a],
      d_content: params[:d_content],
      c_content: params[:c_content],
      b_content: params[:b_content],
      a_content: params[:a_content],
      abet_score_type: params[:score_type]
    }
    @lo = LearningOutcome.new(data)
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
    @lo.destroy_all
    flash.alert = I18n.t('learing_outcome.deleted')
    redirect_to admin_subject_url(@subject)
  end
end