class Admin::StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_url
    flash.alert = I18n.t('student.deleted')
  end

  def create
    @student = Student.new(student_param)
    if @student.save
      flash.alert = I18n.t('student.created')
      redirect_to admin_students_url
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def student_param
    params.require(:student).permit(:first_name, :last_name, :phone, :code, :original_class_id, :birthday)
  end
end
