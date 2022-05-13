class Admin::PiController < Admin::HomeController
  before_action :init
  def new
  end

  def create
    data = {
      so_id: @so.id,
      content: params[:content]
    }
    @pi = Pi.new(data)
    if @pi.save
      flash.alert = I18n.t('pi.created')
      redirect_to admin_so_path(@so)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def show
    @pi_lo = PiLo.where(pi_id: params[:id])
    
    @data = {
      'A': 0,
      'B': 0,
      'C': 0,
      'D': 0,
      'N/A': 0,
    }

    pi_los = PiLo.where(pi_id: params[:id], priority: 'H')
    pi_los.each do |pi_lo|
      lo = LearningOutcome.find(pi_lo.learning_outcome_id)
      section_class_ids = SectionClass.where(subject_id: lo.subject_id).pluck(:id)
      student_classes = StudentClass.where(section_class_id: section_class_ids)
      student_classes.each do |student_class|
        student = Student.find(student_class.student_id)
        score = student.get_score(lo.subject_id, lo.abet_score_type)
        if score == 'N/A'
          @data['N/A'.to_sym] += 1
        elsif score < lo.d_c.to_i
          @data['D'.to_sym] += 1
        elsif score < lo.c_b.to_i
          @data['C'.to_sym] += 1
        elsif score < lo.b_a.to_i
          @data['B'.to_sym] += 1
        else
          @data['A'.to_sym] += 1
        end
      end
    end
  end

  def destroy
    @pi.destroy
    redirect_to admin_so_url(@so)
  end

  def init
    @so = So.find(params[:so_id])
    @pi = Pi.find(params[:id]) if params[:id]
    @pi = @pi || Pi.new
  end
end