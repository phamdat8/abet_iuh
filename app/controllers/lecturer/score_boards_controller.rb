class Lecturer::ScoreBoardsController < Lecturer::HomeController
  def new
    @score_board = ScoreBoard.new
    @class = SectionClass.find(params[:section_class_id])
    @student_ids = StudentClass.where(section_class_id: params[:section_class_id]).pluck(:student_id)
    @subject = Subject.find(@class.subject_id)
    @score_type_ids = ScoreType.where(subject_id: @subject.id).pluck(:id)
  end

  def create
    @score_board = ScoreBoard.new
    @score_board.student_id = params[:student_id]
    @score_board.score_type_id = params[:score_type_id]
    @score_board.score = params[:score]
    @class = SectionClass.find(params[:section_class_id])
    @student_ids = StudentClass.where(section_class_id: params[:section_class_id]).pluck(:student_id)
    @subject = Subject.find(@class.subject_id)
    @score_type_ids = ScoreType.where(subject_id: @subject.id).pluck(:id)
    @score_board.score = -1 if @score_board.score.nil?
    if @score_board.save
      flash.alert = I18n.t('score_board.created')
      redirect_to lecturer_section_class_url(@class)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end
end