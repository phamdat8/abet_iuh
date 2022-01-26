class Admin::OriginalClassesController < ApplicationController
  before_action :set_original_class, only: %i[ show edit update destroy ]

  # GET /admin/original_classes or /admin/original_classes.json
  def index
    @original_classes = OriginalClass.all
  end

  # GET /admin/original_classes/1 or /admin/original_classes/1.json
  def show
  end

  # GET /admin/original_classes/new
  def new
    @original_class = OriginalClass.new
  end

  # GET /admin/original_classes/1/edit
  def edit
  end

  # POST /admin/original_classes or /admin/original_classes.json
  def create
    @original_class = OriginalClass.new(original_class_params)

    respond_to do |format|
      if @original_class.save
        format.html { redirect_to admin_original_class_url(@original_class), notice: "Original class was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/original_classes/1 or /admin/original_classes/1.json
  def update
    respond_to do |format|
      if @original_class.update(original_class_params)
        format.html { redirect_to admin_original_class_url(@original_class), notice: "Original class was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/original_classes/1 or /admin/original_classes/1.json
  def destroy
    @original_class.destroy

    respond_to do |format|
      format.html { redirect_to admin_original_classes_url, notice: "Original class was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_original_class
      @original_class = OriginalClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def original_class_params
      params.require(:original_class).permit(:name, :code)
    end
end
