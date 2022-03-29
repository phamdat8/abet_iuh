class Admin::AbetLevelsController < Admin::HomeController
  def new
    @abet_level = AbetLevel.new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @abet_level = AbetLevel.new
    @subject = Subject.find(params[:subject_id])
    d_type = params[:d_c].to_i
    c_type = params[:c_b].to_i
    b_type = params[:b_a].to_i
    @abet_level.errors[:base] << I18n.t('abet_level.score_type_required') if params[:abet_score_type].nil? || params[:abet_score_type] == '0' 
    @abet_level.errors[:base] << I18n.t('abet_level.d_c_required') if params[:d_c].nil?
    @abet_level.errors[:base] << I18n.t('abet_level.c_b_required') if params[:c_b].nil?
    @abet_level.errors[:base] << I18n.t('abet_level.b_a_required') if params[:b_a].nil?
    @abet_level.errors[:base] << I18n.t('abet_level.d_c_less_c_b') if d_type >= c_type
    @abet_level.errors[:base] << I18n.t('abet_level.c_b_less_b_a') if c_type >= b_type
    @abet_level.errors[:base] << I18n.t('abet_level.d_c_invalid') if d_type > 10 || d_type < 0
    @abet_level.errors[:base] << I18n.t('abet_level.c_b_invalid') if c_type > 10 || c_type < 0
    @abet_level.errors[:base] << I18n.t('abet_level.b_a_invalid') if b_type > 10 || b_type < 0
    if @abet_level.errors.blank?
      @subject.d_c = d_type
      @subject.c_b = c_type
      @subject.b_a = b_type
      @subject.abet_score_type = params[:abet_score_type]
      @subject.save
      redirect_to admin_subject_url(@subject)
    else
      render 'new'
    end
  end
end