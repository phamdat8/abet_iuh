class Admin::SectionClassesController < Admin::HomeController
  def index
    @section_classes = SectionClass.all
  end

  def new
    @section_class = SectionClass.new
  end
end