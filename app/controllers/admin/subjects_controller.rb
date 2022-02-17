class Admin::SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  # GET /admin/subjects or /admin/subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /admin/subjects/1 or /admin/subjects/1.json
  def show
    @score_types = ScoreType.where(subject_id: params[:id])
  end

  # GET /admin/subjects/new
  def new
    @subject = Subject.new
  end

  # GET /admin/subjects/1/edit
  def edit
  end

  # POST /admin/subjects or /admin/subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to admin_subject_url(@subject), notice: "Subject was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/subjects/1 or /admin/subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to admin_subject_url(@subject), notice: "Subject was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/subjects/1 or /admin/subjects/1.json
  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to admin_subjects_url, notice: "Subject was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
